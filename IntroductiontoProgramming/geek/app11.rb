class Animal
  @@number_animals = 0

  def initialize(color)
    @color = color
    @@number_animals += 1
  end

  def get_color
    return @color
  end

  def get_number_animals
    return @@number_animals
  end
end

dog = Animal.new("brown")
cat = Animal.new("striped")
squirrel = Animal.new("gray")

puts "Number of animals is " + squirrel.get_number_animals.to_s


class MyClass
  def my_method
    puts "This is the only method allowed in MyClass."
  end
  MyClass.freeze
end

class MySubclass < MyClass
  def my_method
    "This is only one of the methods available in MySubclass."
  end

  def my_other_method
    "This is the other one."
  end
end

m = MySubclass.new
p m.my_method