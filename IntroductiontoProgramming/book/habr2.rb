p Hash['key1', 'value1', 'key2', 'value2']

a = -> { 1 + 1 }
p a.call

b = -> (v) { v + 1 }
p b.call(2)


def my_method(hash)
	hash.each { |k,v| puts "#{k} #{v}"}
end

h = {"key1"=>"value1", "key2"=>"value2"}
my_method(h)



def get_hash(**hash)
	puts hash
end

get_hash(a: 1, b: 2)

def get_arr(*arr)
	p arr
end

get_arr(1,2,3,4,5)


class User
	attr_accessor :name, :age, :height

	def initialize(args)
		@name   = args[:name]
		@age    = args[:age]
		@height = args[:height]
	end
		
	def read_arr(arr)
		p arr
	end

	def del_arr(arr)
		arr.pop
		p arr
	end
end

a = (1..5).to_a

arr = User.new(name: "Den", age: 25, height: 6.25)
p arr.name
p arr.age
p arr.height
arr.read_arr(a)
arr.del_arr(a)
arr.del_arr(a)
arr.del_arr(a)
arr.read_arr(a)