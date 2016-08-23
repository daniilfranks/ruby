print "Enter number: "
n = gets.to_i

if n < 0
	puts "не может быть меньше 0"
  exit
end

if n != 0
	puts "Отличео больше нуля"
end

if n == 1
	puts "Один человек"
end

if n == 2
	puts "Два человека"
end

if n >= 3
	puts "Три или больше трех человек"
end