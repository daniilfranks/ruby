arr = []

loop do 
	arr2 = []

	puts "Add name:"
	a = gets.strip.capitalize

	puts "Add age:"
	b = gets.to_i

	puts "Add gender:"
	c = gets.strip.capitalize

	if a == ""
		exit
	end

	arr2 << a
	arr2 << b
	arr2 << c
	arr  << arr2

	x = 0
	arr.each do |i|
		x += 1
		puts "#{x}. #{i[0]} #{i[1]} #{i[2]}"
	end
end