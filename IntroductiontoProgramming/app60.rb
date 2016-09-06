def is_password_weak? password
	input = File.open "password.txt","r"

	while (line = input.gets)
		line.strip!
		
		if password.include? line
			return true
	    end
	end

	return false
end

print "Enter you password: "
my_password = gets.strip

if is_password_weak? my_password
	puts "You password is weak"
else
	puts "You password is not weak"
end