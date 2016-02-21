require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)
brands_hash = Hash.new
title_break = "-" * 30
brand_break = "*" * 30

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
  puts brand_break
  puts toy["title"]
  puts title_break
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


puts title_break
puts brand_break

# For each brand in the data set:
unique_brands = products_hash["items"].map {|item| item["brand"]}.uniq
unique_brands.each do |brand, index|

  # Print the name of the brand
  puts "Brand: " + brand

 
  # Count and print the number of the brand's toys we stock
  btoys = products_hash["items"].select {|item| item["brand"] == brand}

  btotal_stock = 0
  bfull_price = 0
  bpurchases = 0
  bsales = 0
  avg_brand_discount = 0

  btoys.each {|toy| btotal_stock += toy["stock"].to_i}
  btoys.each {|item| bpurchases += item["purchases"].length.to_i}
    btoys.each do |item|
      item["purchases"].each do |i|
        bsales += i["price"].to_f
      end
    end

  puts "Toys in stock : #{btotal_stock}"
   
  #Calculate and print the average price of the brand's toys


  #Calculate and print the total revenue of all the brand's toy sales combined
  

end
        