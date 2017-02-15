items = 'car, cat, dog'
items = Array(items)

p items
p items.is_a?(Array)

class Human
	def hi
		"Hi class Human"
	end
end

class Foo < Human; end

module Man 
	def hi
		"Hi module Man"
	end
end

class Bar < Human
	include Man
end

puts Foo.new.hi

puts Bar.new.hi

puts Bar.ancestors.inspect
