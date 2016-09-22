module MyModule
	def first_method
		puts "First method called"
	end

	def second_method
		puts "Second method called"
	end
end

class MyClass
	include MyModule
end

my_object = MyClass.new
my_object.first_method
my_object.second_method


class MySuperclass
	def hi_supeclass
		puts "Hi super class"
	end
end

module Friendly
	def my_method
		puts "Hi my frind!"
	end
end

module Friendlier
	def method_friendler
		puts "Hello from Friendlier!"
	end
end

class ClassOne < MySuperclass
	include Friendly
	include Friendlier
end

class ClassTwo < MySuperclass
	include Friendly
	include Friendlier
end

ClassOne.new.hi_supeclass
ClassTwo.new.hi_supeclass
ClassOne.new.my_method
ClassTwo.new.my_method
ClassOne.new.method_friendler
ClassTwo.new.method_friendler


module Curios
	def investigate(thing)
		puts "Look at #{thing}"
	end
end

module Clumsy
	def break(thing)
		puts "Knocks over #{thing}"
	end
end

class Monkey
	include Curios
	include Clumsy
end

bubbles = Monkey.new
bubbles.investigate("vase")
bubbles.break("vase")