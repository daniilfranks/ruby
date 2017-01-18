class MultiArray
	include Enumerable
	attr_reader :array

	def initialize(*array)
		@array = array
	end

	def each
		@array.each do |a|
			a.each do |x|
				p x
			end
		end
	end
end

arr = MultiArray.new([1,2], [3], [4])
arr.each

p arr.array.flatten.collect { |arr| arr ** arr }
p arr.array.flatten.map { |arr| arr ** 2 }

arr.array.flatten.each_with_index { |v, k| p "#{k}, #{v}" }
