arr1 = [:first, :second, :third, :fourth]
arr2 = [:before, *arr1, :after]
p arr2

x,y,z = 1,2,3
x,y,z = *arr1
p x
p y
p z

def sum(x,y,z)
	x + y + z
end
arr = [1,2,3]
p sum(*arr)


def greet(greeting, *names)
	names.each do |name|
		puts "#{greeting}, #{name}"
	end
end

greet("Hi", "Den", "Leo", "Glen")

def random_draw(num_times, num_draws)
	num_times.times do
		draws = num_draws.times.map { rand(10) }
		yield(*draws)
	end
end

random_draw(5,3) do |first, second, third|
	puts "#{first} #{second} #{third}"
end