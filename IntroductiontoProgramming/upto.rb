1.upto(3) do |i| 
	puts i
end

1.upto(3){|i| puts i}

1.upto(5) do |i|
 r = rand(1..100)
 i = r 
 puts i
end

a = 500
b = 12
x = 0

1.upto(b) do |i|
	x += a
	puts "#{i}: #{x}"
end
puts "#{x}"
