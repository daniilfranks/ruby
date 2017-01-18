class ArrayEnu
	include Enumerable

	def initialize(*items)
		@items = items.flatten
	end

	def each(&block)
		@items.each(&block)
	end

	def ==(other)
		@items == other
	end
end

ae = ArrayEnu.new([3,1,4], [2,5])
p ae.sort

ae.each{ |arr| p arr }
ae2 = ArrayEnu.new([5,4,3], [2,1])

p ae == ae2
p ae.sort == ae2.sort
