loop do
	number = gets.chomp.to_i
	rand = rand(1..10)

	if number == rand
		puts "Rand number: #{rand}"
		puts "You win"
	else
		puts "Rand number: #{rand}"
		puts "You lose"
	end

	if number == "exit" && ""
		exit
	end
end