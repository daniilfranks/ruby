p arr = []
p arr =["Den", 1]
p arr << "Leo"
p arr = %w[den 32 car]
p arr = [:one, :two]

def get_command
	actions = [:left, :right, :up, :down]

	return actions.sample
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
	puts "Error!!!"
end