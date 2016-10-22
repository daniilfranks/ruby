def age? (a,b)
	a >= b
end

p age?(14,21)
p age?(21,21)
p age?(25,21)

name ||= "no name"
p name

#don't use!
val = rand(1..5)
if val ==  1 || val == 3 || val == 5
	puts "#{val} true"
end


val = rand(1..5)
puts "#{val} true" if [1,3,5].include?(val)


a = (1..5).to_a
p a |= [1]
p a |= [6]

a = %w{1 2 3 4 5}
p a

for i in 5..10
	p i
end

5.times { |i| p i }


people = ["den", "jok", "io", "robin", "ash"]

for i in 0...people.length
	p people[i]
end

people.each { |p| p p.length }

b = 0
people.each { |p| b += p.length }
p b



arr = (1..9).to_a
even_indexes, odd_indexes = (0...arr.length).partition { |i| i.even? }

puts arr.values_at(*even_indexes)
puts arr.values_at(*odd_indexes)


arr = (110..119).to_a
a , b = (0...arr.length).partition { |i| i < 5 }

puts arr.values_at(*b)
puts arr.values_at(*a)


arr = (110..119).to_a
a , b = arr.partition { |i| i < 115 }

p b
p a

p b | a