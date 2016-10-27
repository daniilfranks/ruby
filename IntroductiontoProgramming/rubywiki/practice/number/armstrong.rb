=begin 
Самовлюблённое число, или совершенный цифровой инвариант 
или число Армстронга — натуральное число, которое в данной системе 
счисления равно сумме своих цифр, возведённых в степень, 
равную количеству его цифр. Иногда чтобы считать число таковым, 
достаточно, чтобы степени, в которые возводятся цифры, были равны
m — тогда число можно назвать m-самовлюблённым.

Например, десятичное число 153 — число Армстронга, потому что

13 + 53 + 33 = 153.
=end

class Armstrong
	attr_accessor :number

	def initialize(number)
		@number = number
	end

	def is_number_armstrong?
		@number.to_s.split(//).map(&:to_i).inject(0){|x,y| x + y**(@number.to_s.length) } == @number
	end
end

armstrong = Armstrong.new(115132219018763992565095597973971522401)
p armstrong.is_number_armstrong?



p "="*30

number         = 153
p num_str      = number.to_s
p stepen       = num_str.length
p string_array = num_str.split(//)
p num_array    = string_array.map(&:to_i)
p summ         = 0

num_array.each{ |i| summ += i ** stepen }
p summ

p number == summ ? true : false