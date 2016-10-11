module Stacklike
	def stack
		@stack ||= []
	end

	def add_to_stack(obj)
		stack.push(obj)
	end

	def take_from_stack
		stack.pop
	end
end

class Stack
	include Stacklike
end

s = Stack.new

s.add_to_stack("item one")
s.add_to_stack("item two")
s.add_to_stack("item three")

p s.stack
s.take_from_stack
p s.stack

