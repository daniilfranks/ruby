def int a, b
	return a + b
end

p int 2, 4
p int 5, 8


p 1.odd?
p 2.even?

def odd x
	x % 3 == 1
end

def even x
	x % 2 == 0
end

p odd 1
p odd 2
p even 1
p even 2


def hi
	yield
end

hi { p "Hi Ruby" }

hi_name = lambda {|name| puts "Hi, #{name}"}
hi_name.call "Den"

1.upto(3){puts "Upto"}
3.downto(1){puts "Downto"}


def times_tables
  1.upto(10) { |i| 1.upto(10) { |j| print i.to_s + " x " + j.to_s + " = ", j * i, "\n"} }
end

times_tables


hi_proc = proc {"Hi proc"}
puts hi_proc.call

name_proc = proc {|name| puts "Hi, #{name}"}
name_proc.call "Den"


def namer hi, name 
	return hi + name
end

p namer "Hi", " Den"


def numer val 
	return val + 1
end

p numer 5



def say_gn name
	return "Good night, #{name}"
end

puts say_gn "Ma"


def hi_yield
	yield
	yield
	yield
end

hi_yield {p "Hi yield"}


def den
	if block_given?
		yield
		yield
	else
		puts "I m blockless!"
	end
end

den
den {p "Hi den"}