class ParentClass
  def method1
    puts "Hello from method1 in the parent class"
  end

  def method2
    puts "Hello from method2 in the parent class"
  end
end

class ChildClass < ParentClass
  def method2
    puts "Hello from method2 in the child class"
  end
end

my_object = ChildClass.new
p my_object.method1
p my_object.method2


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