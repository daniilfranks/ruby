class Item

  attr_accessor :price, :weight, :name
  attr_reader   :name
  attr_writer   :age

  def initialize(options={})
    @price = options[:price]
    @weight = options[:weight]
  end

  def info
    
  end

end

class Cart

  attr_reader :items

  def initialize
  	@items = Array.new
  end

  def add_item(item)
    @items.push item
  end

  def remove_items
    @items.pop
  end

  def validate
    @items.each {|i| puts "No price!" if i.price.nil?}
  end
end

#init.rb
#require_relative "cart"
#require_relative "item"

item1 = Item.new({:price => 100, :weight => 10})
puts item1.price
puts item1.weight

puts "========================================="

cart = Cart.new
cart.add_item(Item.new)
cart.add_item(Item.new)
cart.validate
p cart.items

cart.remove_items
p cart.items












