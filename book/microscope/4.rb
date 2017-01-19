def box
	lambda { |param| puts param }
end

box.call('Hi lambda')
box.call('Hi Box')

i = 0

increment = lambda do p 'Increment', i += 1 end
decrement = lambda do p 'Decrement', i -= 1 end

increment.call
increment.call
increment.call
decrement.call
