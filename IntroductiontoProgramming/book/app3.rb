class Parent
	def say_hello
		"Hello from #{self}"
	end
end

class Child < Parent
end

a = Parent.new
puts a.say_hello
puts a.say_hello.object_id
puts Parent.superclass
#p Parent.methods

a = Child.new
puts a.say_hello
puts a.say_hello.object_id
puts Child.superclass

puts Object.superclass
#p Object.methods


class Person
	def initialize(name)
		@name = name
	end

	def to_s
		"Name: #{@name}"
	end
end

den = Person.new("Den")
puts den


module Debug
	def who_am_i
		"#{self.class} (id: #{self.object_id}): #{self.name}"
	end
end

class Photograph
	include Debug
	attr_reader :name

	def initialize(name)
		@name = name
	end
end

class EightTrack
	include Debug
	attr_reader :name

	def initialize(name)
		@name = name
	end
end

pk = Photograph.new("Phil Kholin")
jd = EightTrack.new("Jack Dikins")

puts pk.who_am_i
puts jd.who_am_i