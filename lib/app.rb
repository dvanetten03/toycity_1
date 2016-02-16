require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
puts ""
puts "Today's Date: " + Time.now.strftime("%m/%d/%Y")

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
products_hash["items"].each do |toy|
  # Print the name of the toy 
  puts "*********************************"
  puts toy["title"]
  puts "---------------------------------"
  #Print the retail price of the toy
  puts "Retail Price: $" + toy["full-price"]
# Calculate and print the total number of purchases
  puts "Total Number of Purchases: " + toy["purchases"].length.to_s
  # Calculate and print the total amount of sales
  total_sales = 0.0
  toy["purchases"].each do |purchase|
    total_sales += purchase["price"].to_f
  end
  puts "Total Sales: $#{total_sales}"

  # Calculate and print the average price the toy sold for
  avg_price = total_sales/toy["purchases"].length
  puts "Average Price: $#{avg_price}"

  # Calculate and print the average discount (% or $) based off the average sales price
  avg_discount = ((toy["full-price"].to_f - avg_price.to_f ) / toy["full-price"].to_f) * 100
  puts "Average Discount: #{avg_discount.round(2)}%"
  puts ""

end

	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
unique_brands = products_hash["items"].map {|item| item["brand"]}.uniq
  unique_brands.each do |brand|
  # Print the name of the brand
    puts unique_brands
  # Count and print the number of the brand's toys we stock
    puts "In stock: " 
  
  # Calculate and print the average price of the brand's toys
    puts "Average Price of toys: " 
  # Calculate and print the total revenue of all the brand's toy sales combined

end