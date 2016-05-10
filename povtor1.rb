#int = 1000 * 0.13
#puts int.to_i

#int2 = 1000*12*0.13
#puts int2.to_i

#Рассчет налога
#puts "Введите вашу зарплату за месяц"
#zarplata = gets.chomp.to_f

#puts "Введите количество месяцев"
#date = gets.chomp.to_i

#puts "Введите % по налогу"
#nalog = gets.chomp.to_f

#itog = zarplata * date * nalog / 100
#puts "Ваш налог за: #{date} месяц(ев), равен сумме #{itog}"

=begin
var = 500
5.times {|i| puts "#{var}"}

var1 = 400
5.times do
  puts "#{var1}"
end

5.downto(-5) {|z| puts "5"}
1.upto(5) {|z| puts "2"}


5.times do |i|
	puts i+1
	puts "Den"
end

10.times do
  print "Den "
  sleep 0.03
end

20.times do |x|
  print "Hi"
  x.times do
    print "!"
  end
  puts
end

1.upto(10) do |p|
  puts "#{p} My work"
end

a = 0
while a < 10
  a += 1
  puts "#{a}"
end
=end

=begin
def hello firstname="", familyname=""
  puts "hello #{firstname} #{familyname}"
end

hello "Den", "Babanov"
hello


def calc f, t
  r = f * t
  puts "Результат: #{r}" 
end

puts "Введите первое значение"
f = gets.chomp.to_i
puts "Введите второе значение"
t = gets.chomp.to_i
calc f, t
=end























































