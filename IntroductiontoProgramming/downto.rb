3.downto(1) do |i|
	puts i
end

3.downto(1){|i| puts i}
3.downto(1){|i| puts i * 2}
3.downto(1){|i| puts "#{i}: Hi Ruby"}

a = 3
b = 1
a.downto(b){|i| puts i}

x = 25000
y = 12
i = 0
y.downto(1) do |m|
	i += x
	puts "#{m}: #{i}"
end

month = 36
sum = 500000
monthsum = sum / month

month.downto(1) do |mm|
	sum -= monthsum
	puts "Month: #{mm}. Balance owed: #{sum}"
end

x = 0
12.downto(1) do |i|
	y = rand(1..100)
	x = y
	puts "#{i}. Random number: #{x}"
end



