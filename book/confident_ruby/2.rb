# equal
obj = 'a'
other = obj.dup

p obj.object_id
p other.object_id

p obj == other
p obj.equal?(other)
p obj.equal?(obj)

p 1 == 1.0
p 1.eql?(1.0)
p 1.eql?(1)

p '*'*40

# extend
module Mod
	def hello
		'Hi Mod'
	end
end

class Foo
	def hello
		'Hi Class'
	end
end

p f = Foo.new
p f.hello

p f.extend(Mod)
p f.hello

p '*'*40

# include
module ModX
	def hello
		'Hi ModX'
	end
end

class Bar
	include ModX
	def hello
		'Hi Class'
		# super
		super
	end
end

p f = Bar.new
p f.hello

p '*'*40

# freeze
a = [1,2,3,4,5].freeze
#a << 6
#p a
p a.frozen?

# inspect
array = [1,2,3,4,5, 'hello']
p array.inspect
p Time.new.inspect

User = Struct.new(:name)
p den = User.new('Den')
p den.inspect

p '*'*40

# instance_of?(class)
class A
	attr_accessor :a
end

class B
	attr_accessor :b
end

class C
	#attr_accessor :c, :d

	def initialize(c = '', d = '')
		@c, @d = c, d
	end
end

p a = A.new
p b = B.new
p c = C.new

p a.instance_of?(A)
p a.instance_of?(B)
p a.instance_of?(C)

p '*'*40

# instance_variable_defined?(symbol)
p defined_c = C.new('cat', 99)
p defined_c.instance_variable_defined?(:@c)
p defined_c.instance_variable_defined?('@d')
p defined_c.instance_variable_defined?(:@z)

# instance_variable_get(:@c)
p defined_c.instance_variable_get(:@c)
p defined_c.instance_variable_get(:@d)

# instance_variable_set(:@z)
p defined_c.instance_variable_set(:@y, 'NY')
p defined_c.instance_variable_set(:@z, 'Boston')

p defined_c

p defined_c.instance_variables
