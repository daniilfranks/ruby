input = File.open('password.txt','r')

total = 0
while (line = input.gets)
	line.strip!
	if line.size == 6
		puts line
		total += line.split.size
	end
end

puts "Total: #{total}"
input.close
