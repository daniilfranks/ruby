print "Enter you money: "
money = gets.to_f

print "Enter month: "
month = gets.to_i

x = 0
1.upto(month) do |i|
	x += money
	puts "#{i}: #{x}"
end