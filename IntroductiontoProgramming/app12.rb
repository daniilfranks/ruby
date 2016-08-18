print "Enter you money: "
x= gets.to_f

print "Enter year : "
n = gets.to_i

s = 0
1.upto(n) do |n|
	1.upto(12) do |mm|
		s+= x
		puts "#{n}:year #{mm}:month #{s}:money"
	end
end