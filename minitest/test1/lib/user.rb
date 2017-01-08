# Default class User
class User
  attr_accessor :name, :age, :city, :items

  def initialize(name, age, city)
    @name = name
    @age  = age
    @city = city
    @items  = []
  end

  def hello
    "Hello #{@name}, #{@age}, #{@city}"
  end

  def add_items(*item)
  	@items << item
  end

  def show_items
  	@items.join(', ')
  end
end

# ruby -I lib test/test_user.rb
user = User.new('Den', 25, 'Kazan')

user.add_items('cat', 'dog')
p user.items
p user.show_items