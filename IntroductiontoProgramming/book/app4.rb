p 1.class
p 1.1.class
p 100000000000000000.class
p "string\n".class
p 'string\n'.class
p Array.new.class
p Hash.new.class
p true.class
p false.class
p nil.class

3.times { puts "Ruby!" }
1.upto(3) { puts "Upto!" }
3.downto(1) { puts "Downto!" }

a = [3,2,1]
a[3] = a[2] - 1
a.each { |elt| puts elt+1 }

def squ(x)
	puts x*x
end
squ 5

x = 2
p x += 2
p x -= 1

x, y = 1, 2
a, b = b, a
x,y,z = [1,2,3]

p (1..3).to_a
p (1...3).to_a

a = Array.new
a = []
a = %w[]

p (1..10) === 5
p String === "s"
p /\d+/ === "123"

p 1 <=> 2
p 1 <=> 1
p 2 <=> 1 

p 2 != 2

f = "ice"
f.freeze
#p f.capitalize!

def factorial(n)
	if n < 1
		raise "argument must be > 0"
	elsif n == 1
		1
	else
		n * factorial(n-1)
	end
end

puts factorial(4)


def factorial(n)
	raise "bad argument" if n < 1
	return 1 if n == 1
	n * factorial(n-1)
end

puts factorial(4)


p = proc { |x,y| x+y }
puts p.call(1,2)

l = lambda { |x,y| x*y }
puts l.call(2,5)