#Written by: you!
print "Введите ваше имя? "
name = gets.strip.capitalize
puts "Привет, #{name}!"

x = 0
number_c = rand(1..100)

loop do 
	print "Введите число: "
	number_u = gets.to_i

	if number_c > number_u
		puts "Не угадали больше #{number_u}"
		x += 1
		puts "Попытка №#{x} из 10"
	elsif number_c < number_u
		puts "Не угадали меньше #{number_u}"
		x += 1
		puts "Попытка №#{x} из 10"
	elsif number_c == number_u
		puts "Загаданное число #{number_c}"
		puts "Вы выйграли!!!"
		break
	else
		x == 10
		break
		puts "Вы проиграли!!!"
	end
end