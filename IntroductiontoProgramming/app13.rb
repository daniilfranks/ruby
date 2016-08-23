print "(Y/N): "
a = gets.strip.capitalize

if a == "Y"
	puts "Yes"
elsif a == "N"
	puts "No"
else
	puts "Incorrect data"
end