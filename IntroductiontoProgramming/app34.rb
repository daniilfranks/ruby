arr = []

loop do 
	puts "Add name:"
	a = gets.strip.capitalize

	if a == ""
		exit
	end

	arr << a

	x = 0
	arr.each do |name|
		x += 1
		puts "#{x}. #{name}"
	end
end