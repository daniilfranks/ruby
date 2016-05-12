class Item

  attr_accessor :real_price, :weight, :name
  #attr_reader   :test
  #attr_writer   :age

  def initialize(options={})
    @real_price = options[:price]
    @weight = options[:weight]
    @name = options[:name]
  end

  def info
    yield(price)
    yield(weight)
    yield(name)
  end

  def self.discount
    if Time.now.month == 5
      0.3
    else
      0.1
    end
  end

  def price
    (@real_price - @real_price*self.class.discount) + tax if @real_price
  end

  def to_s
    "#{self.name}:#{self.price}:#{self.weight}"
  end

private

  def tax
    type_tax = if self.class == VirtualIteam
      1
    else
      2
    end
    cost_tax = if @real_price > 5
      @real_price*0.2
    else
      @real_price*0.1
    end
    cost_tax + type_tax
  end

end

module ItemContainer

  #module Manager
  module ClassMethods
    def min_price
      100 
    end
  end

  module InstanceMethods
    def add_item(item)
      unless item.price < self.class.min_price
        @items.push item
      end
    end

    def remove_items
      @items.pop
    end

    def validate
      @items.each {|i| puts "No price!" if i.price.nil?}
    end

    def delete_invalid_items
      @items.delete_if {|i| i.price.nil? }
    end
  #end

  #module Info
    def count_valid_items
      @items.count {|i| i.price}
    end
  #end
  end

  def self.included(base)
    base.extend ClassMethods
    base.class_eval do
      include InstanceMethods
    end
  end

end

class Cart
  include ItemContainer
  #include ItemContainer::Manager

  attr_reader :items

  def initialize(owner)
  	@items = Array.new
    @owner = owner
  end

  def save_to_file
    File.open("#{@owner}_cart.txt", "w") do |f|
      @items.each {|i| f.puts i}
    end  
  end

  def read_from_file
    return unless File.exists?("#{@owner}_cart.txt")
    item_fields = File.readilines("#{@owner}_cart.txt")
    item_fields.map! {|i| i.chomp}
    item_fields.map! {|i| i.split(":")}
    item_fields.each {|i| @items << RealItem.new(name: i[0], price: i[1].to_i, weight: i[2].to_i)}
    @items.uniq!
  end
end

class Order
  include ItemContainer
  #include ItemContainer::Manager
  #include ItemContainer::Info

  attr_reader :items

  def initialize
    @items = Array.new
  end

end

class VirtualIteam < Item

end

class RealIteam < Item

end


#init.rb
#require_relative "cart"
#require_relative "item"
=begin
item = Item.new({:price => 100, :weight => 10, :name => "Car"})
item.info {|info| puts info }

puts "========================================="
cart = Cart.new
cart.add_item(Item.new)
cart.add_item(Item.new)
cart.validate
p cart.items

cart.remove_items
p cart.items
puts "========================================="

item1 = Item.new({:price => 150, :weight => 4, :name => "Bmw"})
item2 = Item.new({:price => 123, :weight => 3, :name => "Audi"})

cart = Cart.new
cart.add_item item1
cart.add_item item2

cart.delete_invalid_items
p cart.items

puts "========================================="

item3 = RealIteam.new({:price => 70, :weight => 1, :name => "Lada"})
item4 = VirtualIteam.new({:price => 4, :weight => 4, :name => "Logan"})

cart = Cart.new
cart.add_item item3
cart.add_item item4

puts item3.price

p cart.items

puts "========================================="

item1 = VirtualIteam.new({:price => 150, :weight => 4, :name => "Bmw"})
item2 = RealIteam.new({:price => 123, :weight => 3, :name => "Audi"})
item3 = RealIteam.new({:price => 1, :weight => 3, :name => "Kia"})
=end

=begin
cart = Cart.new
cart.add_item item1
cart.add_item item2
puts cart.items.size

order = Order.new
order.add_item item1
order.add_item item2
order.add_item item3
puts order.items.size

puts order.count_valid_items

cart = Cart.new
cart.add_item item1
cart.add_item item2
cart.add_item item3

puts cart.items.size
=end

@items = []
@items << VirtualIteam.new({:price => 150, :weight => 4, :name => "bmw"})
@items << RealIteam.new({:price => 123, :weight => 3, :name => "audi"})
@items << RealIteam.new({:price => 130, :weight => 3, :name => "kia"})

#add_to_cart.rb
#require_relative "init"
#ruby add_to_cart.rb danil bmw audi
