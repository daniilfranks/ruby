=begin
puts "Enter you number"
number = gets.chomp.to_i

if number == 5
	puts "You win"
elsif number == 10
	puts "You win"
else
	puts "You lose"
end
=end

a = 10
puts "a is 10" if a == 10
b = 5
puts "b is not 10" unless b == 10

p 1 < 2
p 2 > 1
p 3 <= 4
p 5 >= 5
p 7 == 7
p 7 != 8

w = 2
z = 5
y = 5
puts "Yes" if w && z == y