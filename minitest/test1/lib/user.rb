# Default class User
class User
  attr_accessor :name, :age, :city

  def initialize(name, age, city)
    @name = name
    @age  = age
    @city = city
  end

  def hello
    "Hello #{@name}, #{@age}, #{@city}"
  end
end

# ruby -I lib test/test_user.rb
