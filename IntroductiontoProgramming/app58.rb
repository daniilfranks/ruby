input = File.open "password.txt","r"

while (line = input.gets)
	line.strip!
	if line.size == 6
		output = File.open("password2.txt","a")
		output.write "#{line}\n"
		output.close
    end
end
