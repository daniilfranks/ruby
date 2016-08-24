def get_command
	x = rand(1..4)

	if x == 1
		cmd = :left
	elsif x == 2
		cmd = :right
	elsif x == 3
		cmd = :up
	else x == 4
		cmd = :down
	end

	return cmd
end

command = get_command

if command == :left
	puts "Left"
elsif command == :right
	puts "Right"
elsif command == :up
	puts "Up"
elsif command == :down
	puts "Down"
else
	puts "ERROR!!!"
end