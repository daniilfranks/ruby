string = "I love Ruby"
integer = 17.to_s
p string.length
p integer.length


a = 21

if a >= 21
	puts "Open"
else
	puts "Close"
end

name = " "

if name.strip == ""
	puts "No name"
else
	puts "Hi #{name}"
end


=begin
puts "1.A 2.B"
quest = gets.strip.chomp.capitalize

if quest == "A"
	puts "A"
	exit
else
	puts "3.C 4.D"
	quest = gets.strip.chomp.capitalize

	if quest == "C"
		puts "C"
	else
		puts "D"
		exit
	end
end
=end

arr1 = [1,2,3,4,5]
arr1.each{|i| p i} 

arr2 = []
arr2 << "Kia"
arr2.push("Mazda","Opel")
p arr2[0]
arr2.delete("Mazda")
p arr2

i = 1
while i <= 5 do
	puts i 
	i += 1
	sleep 1
end


arr3 = [1,2,3,4,5,6,7,8,9,10]
arreven = []
i = 0

for number in arr3 do
	if number.even?
		i += 1
	else
		arreven << number
	end
end

puts "==========================="
puts arreven

argument = ARGV[0]
if argument == "v"
	puts "Version: 0.1"
else
	puts "No parametrs"
end
#ruby gb1.rv v