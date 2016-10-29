#Необходимо найти максимальное из этих чисел.
s = "1 2 3 4 5 6 7 8"
p s.split.map{ |i| i.to_i }.max
p s.split.map(&:to_i).max

# Необходимо посчитать количество слов с четным количеством символов.
str = "ruby on rails. one love!"
p str.split.count{|i| i.size.even?}

# Необходимо подсчитать количество букв "А" в этой строке.
str = "City Alabama"
p str.scan(/[Aa]/).length

#Необходимо посчитать количество слов.
str = "ruby on rails. one love!"
p str.split.length

#Дана строка в которой содержатся цифры и буквы. 
#Необходимо расположить все цифры в начале строки, а буквы -- в конце.
s = "a1c5f93po01h"
p s.split('').sort.join

#Необходимо перемешать все слова в случайном порядке
s = "ruby on rails. one love!"
p s.split.shuffle.join(' ')

#Необходимо упорядочить слова по количеству букв в каждом слове.
s = "ruby on rails. one love!"
p s.split.sort_by(&:length).join(' ')