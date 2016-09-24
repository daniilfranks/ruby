a = [34,"hi",4.45]
p a.class
p a.length
p a[1]
a[3] = "new"
p a
p a.push "push"
a.pop
p a
a.shift
p a
p a.unshift "first"
p a.last(2)
p a.first(2)

def words_string(string)
	string.downcase.scan(/\w+/)
end

def count_string(string)
	counts = Hash.new(0)
	for word in string
		counts[word] += 1
	end
	counts
end

string = "I love Ruby on rails. ruby! ruby? love#@"

p scan =  words_string(string)
p count_string(scan)


def fib_up_to(max) 
	i1, i2 = 1, 1  
	while i1 <= max
		yield i1
		i1, i2 = i2, i1+i2
	end
end

fib_up_to(1000) {|f| print f, " " }
puts

arr = [1,2,3,4,5,6,7]

arr.each{|value| p value * 3}

sum = 0
arr.each do |value|
	sum += value
	puts value / sum
end

arr.each do |value|
	sq = value * value
	sum += sq
end
puts sum

name = lambda { |param| puts "Hi #{param}" }
name.call "Den"
name.call "Oskar"

def times(number)
	lambda { |n| number * n}
end

p1 = times(2)
p p1.call(2)
p p1.call(3)
p p1.call(4)

def power
	value = 1
	lambda { value += value }
end

power_proc = power

puts power_proc.call
puts power_proc.call
puts power_proc.call