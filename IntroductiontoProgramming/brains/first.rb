puts "Hi ruby"
puts 1
puts "1"
puts 1 + 2
puts "1" + "2"

name = "Den "
puts name * 2
puts "Hi, #{name}"

p 1+2
p 2-1
p 2*2
p 9/3

p 2 == 3
p 2 != 2
p 2 <= 3
p 2 >= 1
p 2 > 1
p 2 < 3

p 1+2*3
p (1+2)*3

p true && true
p true && false
p false && true
p false && false

p (2<3) && (3>2)
p (4<3) && (3>2)

p (2<3) || (3>2)
p (4<3) || (3>2)

if 2 > 3
	puts "ok"
end

a = "Den"
b = "Den"
if a == b && "Jok"
	puts "a == b"
end

c = "Ash"
unless a == c
	puts "unless"
end

i = -15

if i <= 5
	puts "> 5"
elsif i <= 10
	puts "> 10"
else
	puts "error"
end

a = 0
while a < 10
	a += 1
	puts "#{a}: Hi ruby"
end



if ARGV[0]
	number = ARGV[0].to_i
else
	number = 1
end	

while number < 10
	number += 1
	puts "#{number}: Hi ruby"
end