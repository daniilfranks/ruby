print "Enter you password: "
my_password = gets.strip

input = File.open "password.txt","r"

while (line = input.gets)
	line.strip!
	
	if line == my_password
		puts "You password is weak"
		exit
    end
end

puts "You password is not weak"