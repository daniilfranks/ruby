=begin
print "Integer please: "
user_num = Integer(gets.chomp)

if user_num < 0
  puts "You picked a negative integer!"
elsif user_num > 0
  puts "You picked a positive integer!"
else
  puts "You picked zero!"
end
=end

if 1 < 10
	puts "omg Carl"
end

if 1 < 10
	puts "omg Carl"
else
	puts "good"
end

if 1 < 10
	puts "omg Carl"
elsif 1 > 10
	puts "good"
else
	puts "==="
end

hungry = false

unless
  puts "I'm writing Ruby programs!"
else
  puts "Time to eat!"
end

p is_true = 2 != 3
p is_false = 2 == 3
p test_1 = 17 > 16
p test_2 = 21 < 30
p test_3 = 9 >= 9
p test_4 = -11 <= 4

p test_1 = 77 != 77
p test_2 = -4 <= -4
p test_3 = -44 < -33
p test_4 = 100 == 1000

p boolean_1 = 77 < 78 && 77 < 77
p boolean_2 = true && 100 >= 100
p boolean_3 = 2**3 == 8 && 3**2 == 9

p boolean_1 = 2**3 != 3**2 || true
p boolean_2 = false || -10 > -9
p boolean_3 = false || false

p boolean_1 = !true
p boolean_2 = !true && !true
p boolean_3 = !(700 / 10 == 70)

p boolean_1 = (3 < 4 || false) && (false || true)
p boolean_2 = !true && (!true || 100 != 5**2)
p boolean_3 = true || !(true || false)

a = 10
b = 11
if a < b
  print "a is less than b!"
elsif b < a
  print "b is less than a!"
else
  print "b is equal to a!"
end

problem = false
print "Good to go!" unless problem

p test_1 = 8 > 10
p test_2 = 8 == 10
p test_3 = 8 != 10

p test_1 = ( 1 == 1 ) && ( 2 == 2 )
p test_2 = ( 1 == 2 ) || ( 2 == 2 )
p test_3 = ( 4 == 2 ) || ( 4 == 2 )