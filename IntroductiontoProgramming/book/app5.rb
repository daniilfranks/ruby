class Point
	attr_accessor :x, :y

	def initialize(x,y)
		@x, @y = x, y
	end

	def get_arr(*array)
		array.each { |i| p i}
	end

	def to_s
		"#{@x} #{@y}"
	end
end

p = Point.new(12,74)
puts p
p.x = 99
p.y = "y"
puts p
puts p.y

arr = [1,2,3,4,5]
car = ["kia","lada","qb"]
p.get_arr(arr)
p.get_arr(car)



def some_methods(hash={})
	hash[:name]
end

puts some_methods(name: "Den")


hash = {key1: "val1", key2: "val2"}
string = ""
hash.each { |k,v| string << "#{k} #{v}\n"}
puts string


public
def word_count
	hash = Hash.new(0)
	self.downcase.scan(/(\w+([-'.]\w+)*)/) { |word, ignore| hash[word] += 1}
	hash
end

puts %{dog Dogs Dog dog cat Cat car Car car}.word_count
puts "I love ruby ruby. F.B.I man-about".word_count


a = ['i1','i2','i3']
puts a[rand(a.size)]

hash = {key1: "val1", key2: "val2", key3: "val3"}
puts hash.values
puts hash.values.size
values = hash.values
puts hash.values[rand(values.size)]


array = ['junk', 'junk', 'junk', 'val1', 'val2'] 
3.upto(array.length-1) { |i| puts "#{array[i]}" } 

for i in (1..3)
	puts i
end

array = ['junk', 'junk', 'junk', 'val1', 'val2']

for i in (0...array.length)
	puts "#{i} #{array[i]}"
end

puts "============================"
index = 0
while index < array.length
	puts "#{index} #{array[index]}"
	index += 1
end

a, b, *c = [12,23,234,43534,21312312]
p a,b,c