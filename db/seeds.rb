class Seed

  def self.begin
    seed = Seed.new
    seed.generate_admin
    seed.generate_products
  end

  def generate_admin
    User.create!(name: "test", email: "test@gmail.com", password: "123456", admin: true)
  end
  p "created a #{User.count} javis user"


  def generate_products
    20.times do |i|
      Product.create!(name: Faker::Lorem.word, price: rand(10...100), description: Faker::Lorem.sentence(5, false, 0).chop)
    end
    p "created a #{Product.count} javis products"
  end
end

Seed.begin
