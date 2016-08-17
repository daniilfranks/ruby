=begin
print "Enter value: "
a = gets.chomp.to_i
puts a + a * a
end
=end

p 1.class
p 22.class
p 555444333.class
p "22".class
p "000".class
p 0.class
p 33333333333333333333333333333333333333.class
p 0.000001.class


# I = U/R

puts "Enter voltage(U):"
u = gets.chomp.to_f

puts "Enter resistance(R):"
r = gets.chomp.to_f

i = u/r 

puts "Result: #{i}"