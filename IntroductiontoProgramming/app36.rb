#arr = [["den",25,"m"],["anna",18,"g"],["alish",31,"l"]]
#puts arr[2][0]
#puts arr[1]
#puts arr[0][2]

puts "R,S,P"
s = gets.strip.capitalize

if s == "R"
	user_choice = :rock
elsif s == "S"
	user_choice = :scissors
elsif s == "P"
	user_choice = :paper
else
	puts "Error!!!"
	exit
end

arr = [:rock, :scissors, :paper]
computer_choice = arr.sample

puts "User choice: #{user_choice}"
puts "Computer choice: #{computer_choice}"

matrix = [
	[:rock, :paper, :second_win],
	[:rock, :scissors, :first_win],
	[:rock, :rock, :drow],

	[:paper,	:rock,		:first_win],
	[:paper,	:scissors,	:second_win],
	[:paper,	:paper,		:draw],

	[:scissors,	:rock,		:second_win],
	[:scissors,	:paper,		:first_win],
	[:scissors, :scissors,	:draw]
]

matrix.each do |item|
	if item[0] == user_choice && item[1] == computer_choice
		if item[2] == :first_win
			puts "User wins!"
		elsif item[2] == :second_win
			puts "Computer wins!"
		elsif item[2] == :draw
			puts "Draw!"
		end
		exit
	end
end