# is_a?(Class) kind_of?(Class)
p 1.is_a?(Integer)
p 'string'.is_a?(String)
p [1,2,3].is_a?(Array)
p {}.is_a?(Hash)
p [].is_a?(Hash)

class A; end
class B; end
class C; end

p a = A.new
p a.is_a?(A)
p a.is_a?(B)
p a.is_a?(C)

p '*'*40

# method
class Demo
	def initialize(name)
		@name = name
	end

	def hello
		"Hello #{@name}"
	end
end

den = Demo.new('Den')
p den.hello
p den.method(:hello)
p den.method(:hello).call
p den.method('hello').call

p '*'*40

# methods
p den.methods
p den.methods.size

p '*'*40

# nil
p den.nil?
p Object.new.nil?
p nil.nil?
p ''.nil?

p '*'*40

# __id__ object_id
string = 'string'
p string.object_id
p string.__id__

arr = [1,2,3,4,5]
p arr.object_id
p arr.__id__

# methods
#p den.private_methods
#p den.protected_methods
#p den.public_methods

p den.public_send(:hello)

p '*'*40

den.instance_variable_set(:@state, 'Tatarstan')
p den.instance_variable_get(:@state)
p den

# remove_instance_variable()
den.remove_instance_variable(:@state)
p den

# respond_to?
p den.respond_to?(:hello)
p den.respond_to?(:to_s)
p den.respond_to?(:by)

p '*'*40

# send
class Items
	def hello(*array)
		"Items: " + array.join(', ')
	end

	def name(name)
		"Hi #{name}"
	end

	def hash_items(options = {})
		p options.keys
		p options.values
	end
end

item = Items.new
p item
p item.send(:hello, 'cat', 'dog', 'car')
p item.send(:name, 'Den')

hash = { 1 => { name: 'Den', age: 25 }, 2 => { name: 'Leo', age: 31 } }
item.__send__(:hash_items, hash)
