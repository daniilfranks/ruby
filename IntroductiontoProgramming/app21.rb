b = rand(1..100)

1.upto(100) do |n| 
	puts "Attempt:#{n}:  Enter you number(1-100): "
	a = gets.to_i

	if a == b
		puts "You win"
		exit
	elsif b > a
		puts "Number > #{a}"
	elsif b < a
		puts "Number < #{a}"
	end
end