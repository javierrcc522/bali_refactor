class OrderItemsController < ApplicationController

  def create
    @order = current_order
    if @order.order_items.exists?(:product_id => item_params[:product_id])
      order_item = @order.order_items.where(:product_id => item_params[:product_id]).first
      current_quantity = order_item.quantity
      quantity_to_add = item_params[:quantity].to_i
      order_item.quantity = current_quantity + quantity_to_add
      order_item.save
    else
    @item = @order.order_items.new(item_params)
    end
    if @order.save
      session[:order_id] = @order.id
      flash[:notice] = "This product has been added to your cart."
      respond_to do |format|
        format.html { redirect_to products_path }
        format.js { render 'carts/create' }
      end
    else
      flash[:notice] = "Please add items."
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render 'carts/create' }
      end

    end
  end

  def update
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.update_attributes(item_params)
    @order.save
  end


  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    if @order.save
      session[:order_id] = @order.id
      flash[:notice] = "Product has been removed from your order."
      @total = current_order.total_price
      respond_to do |format|
        format.html { redirect_to cart_path }
        format.js { render 'carts/destroy' }
      end
    else
      flash[:notice] = "there was some erros "
      respond_to do |format|
        format.html { redirect_to cart_path }
        format.js { render 'carts/destroy' }
      end
    end
  end


  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id, :user_id)
  end
end
