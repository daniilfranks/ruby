puts "Fill up balance"
money = gets.chomp.to_i

while true
	puts "Pull the handle by pressing Enter"
	gets

	x = rand(111..999)

	if x == 111 && 222 && 333 && 444 && 555 && 666 && 777 && 888 && 999
		money += 100
		puts "Rand number: #{x}"
		puts "You win: 100$"
	else
		money -= 5
		puts "Rand number: #{x}"
		puts "You lose: 5$"
	end

	puts "You balance #{money}"

	if money <= 0
		puts "Game over you balance #{money}"
		exit
	end
end