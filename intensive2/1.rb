#Cart

cart = []
loop do
  puts 'Add item'
  item = gets.strip 
  break if item == ''

  puts 'Add price'
  price = gets.strip.to_i

  puts 'Add quantity'
  quantity = gets.strip.to_i

  cart.push([item, price, quantity])
end

p cart
p cart.inject(0) { |sum, a| sum + a[1] }