balance = 100

hash = {111 => 10, 222 => 20, 333 => 30, 
		  444 => 40, 555 => 50, 666 => 60,
		  777 => 70, 888 => 80, 999 => 90
}

loop do
	puts "Enter to play"
	gets

	a = rand(100..999)

	if hash[a]
		balance += hash[a]
	else
		balance -= 1
	end

	if balance < 0
		exit
	end

	puts "#{a}"
	puts "#{balance}"
end