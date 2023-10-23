#require "faker"
require "csv"

Product.destroy_all
Category.destroy_all

# Populating with Faker

# for prod in 1..676 do
#   prod = Product.create(
#     title: Faker::Commerce.product_name,
#     description: "Best product of the world!",
#     price: Faker::Commerce.price,
#     stock_quantity: Faker::Number.within(range: 1..1000)
#   )
#   prod.save
# end

# Populating with CSV

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |p|
  category = Category.find_or_create_by(name: p["category"])

  next unless category && category.valid?

  category.products.create(
    title: p["name"],
    price: p["price"],
    description: p["description"],
    stock_quantity: p["stock quantity"]
  )
end