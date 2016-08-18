2.times{p "Hi"}

2.times do |i|
	puts "======"
	puts "#{i}: Hi ruby"
end

1.upto(5) do |x|
	puts "#{x+1}: yo"
end

5.times do 
	3.times do
		puts "re!"
	end
end

puts "Enter you name: "
name = gets.strip.capitalize

=begin
3.times do |i|
	sleep 1
	puts "#{i+1}: #{name}"
end
=end

x = 0
10.times do
	2.times do
		x += 1
		sleep 0.03
		print "Den "
	end
end
puts "#{x}"

10.times do |x|
	print "Hi"
	x.times do
		print "!"
	end
	puts
end