name = "Den Jok Ashe Anna Kate Xiao"
p name.split

date = "10/09/2016"
p date.split("/")


hash = {}
x = 0

loop do 
  x += 1
	hash2 = {}

	puts "Add name"
	hash2[:name] = gets.strip.capitalize

	if hash2[:name] == ""
		break
	end

	puts "Add age"
	hash2[:age] = gets.to_i

	puts "Add city"
	hash2[:city] = gets.strip.capitalize

	hash[x] = hash2
end

puts hash
