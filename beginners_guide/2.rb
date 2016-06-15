class Person
	def initialize age
		@age = age
	end

	def age
		@age
	end

	def age_difference_with other_person
		(self.age-other_person.age).abs
	end

	protected:age
end

p fred = Person.new(34)
p chris = Person.new(25)
p chris.age_difference_with(fred)

class Animal
	attr_accessor:name

	def initialize name
		@name = name
	end
end

class Cat < Animal
	def taik
		puts "Meow!"
	end
end

class Dog < Animal
	def taik
		puts "Woof!"
	end
end

cat1 = Cat.new("Max")
cat2 = Cat.new("Clive")
dog1 = Dog.new("Fossie")

puts cat1.taik
puts cat2.taik
puts dog1.taik

module NumberRand
	def NumberRand.random
		rand(100000)
	end
end

puts NumberRand.random

class ParentClass
	def method1
		puts "Method1 in parent class"
	end

	def method2
		puts "Method2 in parent class"
	end
end

class ChildClass < ParentClass
	def method2
		puts "Method2 in child class"
	end
end

object1 = ParentClass.new
object2 = ChildClass.new

p object1.method2
p object2.method1
p object2.method2

module UserfulFeatures
	def class_name
		self.class
	end
end

class User
	include UserfulFeatures
end

x = User.new
puts x.class_name









