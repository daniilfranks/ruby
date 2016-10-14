def gen_times(factor)
	proc { |n| n*factor}
end

times3 = gen_times(3)
times5 = gen_times(5)

p times3.call(12)
p times5.call(5)
p times3.call(times5.call(4))


def proc_form
	proc
end

proc = proc_form { "hi" }
p proc.call

proc { |a| puts a }.call(12)


hi = "Hi"
i = lambda { puts hi }
i.call


p = proc { |i| p i*2 }
arr = [1,2,3]

arr.each(&p)


lam = lambda { |i| p i*2 }
arr = [1,2,3]

arr.each(&lam)


def multi_proc(p1, p2)
	p1.call
	p2.call
end

a = proc { puts "First proc" }
b = proc { puts "Second proc" }

multi_proc(a,b)


proc  = proc { puts "Proc" }
proc.call
p proc.class

lam = lambda { puts "Lambda" }
lam.call
p lam.class


def print_once
	yield
	yield
end

print_once { puts "Block run"}


def one_two_three
	yield 1
	yield 2
	yield 3
end

one_two_three { |num| puts num * 10 }


def exp_block(&block)
	block.call
end

exp_block { puts "Exp block call"}


say_lam = -> { puts "Hi lam"}
say_lam.call

times_lam = ->(x) { puts x*2 }
times_lam.call(10)


t = proc { |x,y| puts "I don't care about arguments!" }
t.call


def say_hi(&block)
	puts "Hi #{block.call}"
end

say_hi { "Den" }


def say_by(block)
	puts "By #{block.call}"
end

say_by proc { "Den" }


def name
	puts "Hi Den"
end

def say_my_name(block)
	block.call
end

say_my_name method(:name)


def my_method
  puts 'Hello World'
  yield if block_given?
end

my_method
my_method { puts "Hi block" }


colours = ['red', 'blue', 'yellow']
p colours.map(&:reverse!)