b = rand(1..100)

t = 10

1.upto(t) do |n| 
	puts "Remaining attempts #{t-n+1}. Enter you number(1-100): "
	a = gets.to_i

	if a == b
		puts "You win"
		exit
	elsif b > a
		puts "Number > #{a}"
	else b < a
		puts "Number < #{a}"
	end
end

puts "You lose!!! Number: #{b}"