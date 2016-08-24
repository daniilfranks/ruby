#p "a" == "a"         #true
#p :p == :p			  #true
#p "a".equal? == "a"  #false
#p :p.equal? == :p    #true

array = []
array << 1
array << 2

puts array


arr = []
while true
	puts "Enter color or stop: "
	color = gets.strip.capitalize

	if color == "Stop"
		puts arr.uniq.reverse
		exit
	end

	arr << color
end
