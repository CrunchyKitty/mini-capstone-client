require 'unirest'

# response = Unirest.get('http://localhost:3000/all_products_url')

# data = response.body

# puts JSON.pretty_generate(data)

# puts Paint ['these are my products',:magenta]

system "clear"

puts "Welcome to my shirt store"
puts "Choose your favorite design"
puts "   [1] See all"
puts "   [2] See one"
puts "   [3] Create new "
puts "   [4] update"
puts "   [5] removed"

input_option = gets.chomp

if input_option == "1"
  response = Unirest.get("http://localhost:3000/shirts")
  products = response.body
  puts JSON.pretty_generate(products)
elsif input_option == "2"
  print "Enter item id:"
  input_id = gets.chomp

  response = Unirest.get("http://localhost:3000/shirts/#{input_id}")
  product = response.body 
  puts JSON.pretty_generate(product)
elsif input_option == "3"
  client_params = {}

  print "item: "
  client_params[:item] = gets.chomp

  print "price: " 
  client_params[:price] = gets.chomp 

  print "image_url: "
  client_params[:image_url] = gets.chomp

  print "description: "
  client_params[:description] = gets.chomp

  response = Unirest.post(
                         "http://localhost:3000/shirts",
                         parameters: client_params
                         )

  shirt_data = response.body

  puts JSON.pretty_generate(shirt_data)

end







