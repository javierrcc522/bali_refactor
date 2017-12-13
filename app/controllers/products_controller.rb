class ProductsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to '/'
      flash[:notice] = "Product has been saved"
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Item deleted"
    redirect_to '/'
  end



  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
