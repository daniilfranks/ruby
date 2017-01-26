def multi_float(a, b)
	if a.is_a?(Float) or b.is_a?(Float)
		raise ArgumentError, 'No float!'
	end
	a * b
end

p multi_float(10, 20)
#p multi_float(10, 20.0)

class Array
	def sum(param = 0)
		inject(param) { |sum, i|  sum + i }
	end
end

p [1,2,3,4,5].sum
p [1,2,3,4,5].sum(10)

class Rectangle
	def initialize(*args)
		case args.size
		when 2
			@top_left, @bottom_right = args
		when 3
			@top_left, length, width = args
			@bottom_right = [@top_left[0] + length, @top_left[1] - width]
		else
			raise ArgumentError, 'Enter 2 or 3 arguments'
		end
	end
end

p Rectangle.new([1,2], [3,4])
p Rectangle.new([1,2], 3,4)


class Name
	attr_reader :first, :last

	def first=(first)
		if first == nil or first.size == 0
			raise ArgumentError.new('Enter you first name!')
		end
		first = first.dup
		first[0] = first[0].chr.capitalize
		@first = first
	end

	def last=(last)
		if last == nil or last.size == 0
			raise ArgumentError.new('Enter you last name!')
		end
		@last = last
	end

	def full_name
		"#{@first} #{@last}"
	end

	def initialize(first, last)
		@first = first
		@last  = last
	end

	def name_class
		"#{self.class.name}"
	end
end

p den = Name.new('Danila', 'Babanov')
p den
p den.full_name

den.first = 'den'
p den.first
#p den.first = nil

p '*'*40

p den.inspect
p den.name_class


API_KEY = 'GFJN8343NF38F'.freeze
#p API_KEY[0] = 'A'
