class Animal
  def initialize
    @color = "red"
  end
  def get_color
    return @color
  end
end

animal = Animal.new
p animal.get_color


class Square
  def self.test_method
    puts "Hello from the Square class!"
  end

  def test_method
    puts "Hello from an instance of class Square!"
  end
end

Square.test_method
Square.new.test_method

class Animal
  def initialize(color)
    @color = color
  end

  def get_color
    return @color
  end
end

class Dog < Animal
  def initialize(color, sound)
    super(color)
    @sound = sound
  end

  def get_sound

    return @sound
  end
end

dog = Dog.new("brown", "Bark")
puts "The new dog is " + dog.get_color
puts "The new dog says: " + dog.get_sound + "" + dog.get_sound