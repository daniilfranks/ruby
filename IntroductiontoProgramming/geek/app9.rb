class Pet
  attr_accessor :name, :age, :gender, :color
end

class Cat < Pet
end

class Dog < Pet
  def bark
    puts "Woof!"
  end
end

class Snake < Pet
  attr_accessor :length
end

qsnake = Snake.new
p qsnake.name = "Lolo"
p qsnake.age = 5
p qsnake.length = 12

spike = Dog.new
puts spike.name = "Spike"
puts spike.bark
puts spike.class


class Hello
  def howdy
    greeting = "Hello, myValue!"
    puts greeting
  end
end

class Goodbye < Hello
  def solong
    farewell = "Goodbye, myValue."
    puts farewell
  end
end

friendly = Goodbye.new
friendly.howdy
friendly.solong
