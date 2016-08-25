arr = ["den","jok","anna","hank"]

loop do
	x = 0
	arr.each do |name|
		x += 1
		puts "#{x}. #{name}"
	end

	print "Enter the number to be deleted: "
	n = gets.to_i
	arr.delete_at(n-1)
end