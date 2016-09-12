one = [1,23,45,65,243,76,21]
two = [45,23,21,56,456,34,9]

proc_25 = Proc.new{|i| i >= 25}
proc_35 = Proc.new{|i| i <= 35}

a = one.select(&proc_25)
b = two.select(&proc_35)

puts a
puts "========="
puts b

puts "========="


str = lambda{|x,y| puts x + y}
str.call(2,3)

def hi_lambda
	s = lambda{"Hi lambda"}
	s.call
end

puts hi_lambda