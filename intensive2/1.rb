#Cart
=begin
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
=end

cart = [['car', 10, 1], ['bar', 5, 3], ['car', 10, 5]]


p cart.uniq { |i| i.first }

arr = []
cart.each do |i|
  arr << i unless arr.assoc(i[0])
end
p arr

#p cart
#p cart.inject(0) { |sum, a| sum + a[1] * a[2] }

