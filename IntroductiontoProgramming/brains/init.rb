require_relative "cart"
require_relative "item"
require_relative "virtual_item"
require_relative "real_item"

=begin
cart = Cart.new
cart.add_item(Item.new)
cart.add_item(Item.new)
cart.validate

p cart.items
cart.remove_item
p cart.items
=end

=begin
item1 = Item.new({:price => 50, :weight => 500, :name => "Car"})
item1.info {|i| puts i}

item2 = Item.new({:weight => 500, :name => "Car"})

cart = Cart.new
cart.add_item item1
cart.add_item item2

cart.delete_invalid_items

p cart.items
=end


item3 = VirtualItem.new({:price => 5, :name => "Dog"})
item4 = RealItem.new({:weight => 900, :price => 500, :name => "Cat"})

cart2 = Cart.new
cart2.add_item item3
cart2.add_item item4

cart2.delete_invalid_items

p cart2.items

puts item4.price
puts item4.real_price