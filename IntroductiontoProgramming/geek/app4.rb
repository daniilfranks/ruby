def squ num 
	num * num
end

p squ 2

def hi_ruby s
	i = 0
	while i < s
		i += 1
		puts "Hi ruby"
	end
end

hi_ruby 3

def arr_point arr, int
	arr.map{|i| i += int}
end

num = [2,3,5,67,23]
puts arr_point num, 5


class Name
	attr_accessor :first, :middle, :last

	def initialize first, middle, last
		@first = first
		@middle = middle
		@last = last
	end

	def self.hi
		"Hi ruby"
	end

	def to_s
		"#{@first} #{@middle} #{@last}"
	end
end

class User < Name
	def initialize first, midle, last, gender
		super(first, midle, last)
		@gender = gender
	end

	def to_s
		super
		"#{@gender}"
	end
end

den = Name.new("Den","M","B")
puts den.first
puts den
den.last = "Bob"
puts den.last

puts Name.hi

jok = User.new("Jok","Z","Y","gender")
puts jok.first
puts jok