require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("./lib/**/*.rb")
require("./lib/product")
require("pg")

DB = PG.connect({:dbname => 'pos_development'})

get("/") do
  @products = Product.all()
  erb(:index)
end

post('/products') do
  name = params.fetch('name')
  price = params.fetch('price')
  status = params.fetch('status')
  @product = Product.new({:name => name, :price => price, :status => status})
  @product.save()
  erb(:success)
end

get("/products/:id/edit") do
  @product = Product.find(params.fetch("id").to_i())
  erb(:product_edit)
end

delete("/products/:id") do
  @product = Product.find(params.fetch("id").to_i())
  @product.delete()
  @products = Product.all()
  erb(:index)
end 

patch("/products/:id") do
  name = params.fetch("name")
  price = params.fetch("price")
  status = params.fetch("status")
  @product = Product.find(params.fetch("id").to_i())
  @product.update({:name => name, :price => price, :status => status})
  @products = Product.all()
  erb(:index)
end
