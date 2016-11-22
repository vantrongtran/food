User.create! name:  "Admin", email: "admin@gmail.com", chatwork_id: "vantrongtran",
password: "111111", password_confirmation: "111111", role: 1
5.times do |c|
  name = "Category#{c + 1}"
  Category.create! name: name
end
categories = Category.order(:created_at).take(10)
50.times do |p|
  name = "Product#{p + 1}"
  price = (Random.rand(4) + 1) * 10000
  quanty = Random.rand(10) + 10
  image = "product.jpg"
  description = Faker::Lorem.sentence(50)
  category_id = Random.rand(4) + 1
  Product.create! name: name, price: price, quanty: quanty,
    image: image, category_id: category_id,
    description: description
end
