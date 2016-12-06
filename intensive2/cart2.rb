require 'pp'

Item = Struct.new(:name, :price)

class Cart
  attr_accessor :cart

  def initialize
    @cart = []
  end

  def add_cart(item)
    @cart.push([item.name, item.price])
  end

  def total
    @cart.inject(0) { |sum, a| sum + a[1] }
  end

  def show
    @cart.each { |i| p "Name: #{i[0]}, Price: #{i[1]}" }
  end
end

car        = Item.new('car', 50)
helicopter = Item.new('helicopter', 140)
bus        = Item.new('bus', 90)

cart1 = Cart.new
cart1.add_cart(car)
cart1.add_cart(helicopter)
cart1.add_cart(bus)

pp cart1
pp cart1.total
cart1.show