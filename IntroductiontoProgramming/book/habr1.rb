x,y,z = 1,2,3
print x,y,z, "\n"

a,b = 1,2
a,b = b,a
print a,b, "\n"

p 9/3.0
p 10-5.0

str = 'Xuby'
str[0] = 'R'
p str

arr = [1,2,3,4,5]
p arr[-1]


def gen_times(factor)
	proc { |n| n*factor }
end

times3 = gen_times(3)
times5 = gen_times(5)

p times3.call(12)
p times5.call(times5.call(4))


arr = ["one", "two", "three"]
p arr.map(&:capitalize)
p arr.map(&:upcase)


class String
	def cool
		self + " is cool!"
	end
end

class Numeric
	def h1
		self*100
	end

	def h2
		self
	end

	def h3
		self + self
	end
end

puts "Ruby".cool

puts 100.h1
puts 10.h2
puts 3.h3