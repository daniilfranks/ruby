class Animal
  attr_accessor :color

  def initialize(color)
    @color = color
  end
end

animal = Animal.new("brown")
puts "The new animal is " + animal.color
animal.color = "red"
puts "Now the new animal is " + animal.color


class Person
  attr_accessor :name, :age
end

x = Person.new
x.name = "Fred"
x.age = 10
puts x.name, x.age


class Employee
      attr_accessor :name
      def initialize
            @name = "" 
      end
end

employee1 = Employee.new
employee1.name = "Aneesha"

puts employee1.name