money = 100

loop do
	puts "Press Enter"
	gets

	x = rand(0..9)
	y = rand(0..9)
	z = rand(0..9)

	if x == 0 && y == 0 && z == 0
		puts "You money"
		money = 0
	end

	if x == 1 && y == 1 && z == 1
		puts "You win 10$"
		money += 10
	elsif x == 2 && y == 2 && z == 2
		puts "You win 20$"
		money += 20
	elsif x == 3 && y == 3 && z == 3
		puts "You win 30$"
		money += 30
	elsif x == 4 && y == 4 && z == 4
		puts "You win 40$"
		money += 40
	elsif x == 5 && y == 5 && z == 5
		puts "You win 50$"
		money += 50
	elsif x == 6 && y == 6 && z == 6
		puts "You win 60$"
		money += 60
	elsif x == 7 && y == 7 && z == 7
		puts "You win 70$"
		money += 70
	elsif x == 8 && y == 8 && z == 8
		puts "You win 80$"
		money += 80
	elsif x == 9 && y == 9 && z == 9
		puts "You win 90$"
		money += 90
	else
		puts "You lose -10$"
		money -= 10
	end

	if money <= 0
		puts "Balance: #{money}"
		puts "Game over"
		exit
	end

  puts "#{x}#{y}#{z}"
	puts "Balance: #{money}"
end