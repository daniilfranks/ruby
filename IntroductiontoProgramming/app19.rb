puts "Enter the number: "
a = gets.to_i

puts "Enter: (/ * - +)"
b = gets.strip

puts "Enter the number: "
c = gets.to_i

r = 0

if b == "/" && c == 0
	puts "You can not divide by zero!!"
	exit
elsif b == "/"
	r = a / c
elsif b == "*"
	r = a * c
elsif b == "-"
	r = a - c
elsif b == "+"
	r = a + c
else
	puts "Incorrect data!!!"
end

puts "Result: #{r}"