def run_3_times
	3.times do
		yield
	end
end

run_3_times {puts 'Hi'}

def run_3_while
	x = 0
	while x < 3
		yield x
		x += 1
	end
end

run_3_while {|x| puts "Hi, index:#{x}"}


x = lambda { puts 'Hi lambda'}
x.call

say_bye = lambda {puts 'Bye'}
week = [x,x,x,x,x,say_bye,say_bye]
week.each do |f|
	f.call
end

sub_10 = lambda do |x|
	return x - 10
end

a = sub_10.call 1000
puts a


balance = 1000

add_10 = lambda {|x| x + 10}
add_20 = lambda {|x| x + 20}
sub_5 = lambda {|x| x - 5}

hash = {111 => add_10, 222 => add_20, 333 => add_10, 444 => add_10, 555 => add_10,
	666 => add_10, 777 => add_10, 888 => add_10, 999 => add_10
}


loop do
	x = rand(100..999)
	puts "#{x}"

	if hash[x]
		f = hash[x]
		balance = f.call balance
	else
		balance = sub_5.call balance
	end

	puts "Balance: #{balance}"
	puts "Enter"
	gets
end