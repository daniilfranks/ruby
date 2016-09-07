require_relative "store_application"

StoreApplication.new

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

=begin
item3 = VirtualItem.new({:price => 5, :name => "Dog"})
item4 = RealItem.new({:weight => 900, :price => 500, :name => "Cat"})

cart2 = Cart.new
cart2.add_item item3
cart2.add_item item4

cart2.remove_item
cart2.delete_invalid_items

p cart2.items

puts item4.price
puts item4.real_price
puts cart2.items.size


item5 = VirtualItem.new({:price => 23, :name => "Dog"})
item6 = RealItem.new({:weight => 500, :price => 49, :name => "Cat"})
item7 = RealItem.new({:weight => 500, :price => 49, :name => "Cat"})
order = Order.new

order.add_item item5
order.add_item item6
order.add_item item7

order.delete_invalid_items

p order.items

puts item6.price
puts item6.real_price
puts order.items.size

puts order.count_valid_items
=end

@items = []
@items << AntiqueItem.new("car", weight: 500, price: 100)
@items << VirtualItem.new({:weight => 500, :price => 100, :name => "error"})
@items << RealItem.new({:weight => 500, :price => 49, :name => "kettle"})
@items << RealItem.new({:weight => 900, :price => 500, :name => "cat"})

cart = Cart.new("den")
cart.add_item RealItem.new({:weight => 500, :price => 100, :name => "car"})
cart.add_item RealItem.new({:weight => 400, :price => 200, :name => "car"})
p cart.all_cars

#puts cart.kind_of?(Cart)
puts @items[0].kind_of?(Item)
puts @items[0].kind_of?(AntiqueItem)
puts @items[0].respond_to?(:info)
puts @items[0].respond_to?(:errorinfo)
puts @items[0].send(:price)
puts @items[0].send(:tax)