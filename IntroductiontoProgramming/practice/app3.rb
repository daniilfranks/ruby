#The programming ruby
a = 1
b = 2
p a + b

3.times { puts "Hi ruby!!!"}

puts "Hi world"

def sum n1, n2
	puts n1 + n2
end

sum("cat", "dog")

p "It is now #{Time.now}"

def say_goodnight name
	result = "Good night, #{name.capitalize}"
	return result
end

puts say_goodnight("den")

arr = ['ant','cat','dog','elk']
p arr[1]
p arr[-1]

hash = {'cello' => 'string', 'drume' => 'percussion'}
p hash['cello']

today = Time.now

if today.saturday?
	puts "Do chores around the house"
elsif today.sunday?
	puts "Relax"
else
	puts "Go to work"
end


class BookInStock
	attr_reader :isbn, :price

	def initialize(isbn, price)
		@isbn = isbn
		@price = Float(price)
	end

	def price=(new_price)
		@price = new_price
	end

	def price_in_cents
		Integer(price*100 + 0.5)
	end

	def price_in_cents=(cents)
		@price = cents / 100.0
	end

	def to_s
		"ISBN: #{@isbn}, price: #{@price}"
	end
end

b1 = BookInStock.new("isbn1", 3)
puts b1

b2 = BookInStock.new("isbn2", 3.14)
puts b2

b3 = BookInStock.new("isbn3", "5.67")
puts b3

b4 = BookInStock.new("isbn4", 12.34)
puts "ISBN = #{b4.isbn}"
puts "Price = #{b4.price}"
b4.price = b4.price * 0.75
puts "New price: #{b4.price}"
puts "Book price in cents: #{b4.price_in_cents}"
b4.price_in_cents = 1234
puts "Price = #{b4.price}"
puts "Price in cents = #{b4.price_in_cents}"