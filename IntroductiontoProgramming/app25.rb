def print_name
	puts "Name1"
	puts "Name2"
	puts "Name3"
end

print_name

def get_pass
	print "Type pass: "
	return gets.strip + "abc"
end

pass = get_pass
puts "#{pass}"

def print_user name
	puts "Hi, #{name}"
end

print_user "Den"


a = 1
@b = 3

def puts_a
	a = 2
	@b = 4
	puts "#{a}"
	puts "#{@b}"
end

p a
p @b
puts_a
p @b


def get_hi
	puts "Hi"
end

def get_command
	get_hi
	"left"
end

command = get_command
puts "#{command}"