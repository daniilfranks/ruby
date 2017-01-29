p 1 <=> 1
p 1 <=> 2
p 2 <=> 1

p '1' === 1

p 1.class
p self.class
p self.class.superclass

# Clone
class User
	attr_accessor :name, :age

	def initialize(name, age)
		@name = name
		@age  = age
	end

	def to_s
		"#{@name}, #{@age}"
	end
end

# Create object
p den = User.new('Den', 25)
p den.object_id
p den.to_s

# Clone object
p carl = den.clone
p carl.object_id
p carl.to_s

# Assigning object
p ramon = carl
p ramon.object_id
p ramon.to_s

p '*'*45

# define_singleton_method
class A
	class << self
		def class_name
			to_s
		end
	end

	def self.name
		to_s
	end
end

A.define_singleton_method(:who_am_i) do 
	"I am #{class_name}"
end

p A.class_name
p A.who_am_i

A.define_singleton_method(:hello_class) do 
	"Hi my name class #{to_s}"
end

p A.hello_class

p '*'*45

1.display
puts
'Hello display'.display
puts
[1,2,3].display
puts

# dup
class Foo
	attr_accessor :foo
end

module Bar
	def bar
		'bar'
	end
end

p foo = Foo.new
p foo.object_id
p foo.foo = 'hi class foo'
foo.extend(Bar)
p foo.bar

p '*'*45

p f1 = foo.clone
p f1.object_id
p f1.foo
p f1.bar

p '*'*45

p f2 = foo.dup
p f2.object_id
p f2.foo
# Error method bar
# p f2.bar
