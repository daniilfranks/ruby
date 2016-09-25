p Time.now

def get(name)
	"Hi #{name}"
end

p get("Den")


def call_block
	puts "Method"
	yield
	puts "Method"
	yield
end

call_block { puts "Block"}


class Book
	attr_reader :name, :price
	attr_writer :price

	def initialize(name, price)
		@name = name
		@price = Float(price)
	end

	def price_in_cents
		Integer(price*100)
	end

	def to_s
		"#{@name} #{@price}"
	end
end

first = Book.new("C+ book", 19.49)
last = Book.new("Ruby book", 15.99)
puts first
puts last

editbook = Book.new("Php", 0)
puts editbook
puts editbook.price = 9.99
puts editbook
puts editbook.price_in_cents


arr = []
arr2 = ("a".."z").to_a
arr2.each_with_index { |item, index| arr << [item, index+1] }
p arr