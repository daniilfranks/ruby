print "How many times will play? "
n = gets.to_i

print "Favorite number: "
f = gets.to_i

1.upto(n) do |mm|

	puts "Play №: #{mm}"

	x = rand(1..50)

	if x == f
		puts "you win"
	end 
end