=begin
a = 5
b = 7
c = 7

if a && b == c
	puts "WIN!"
end
=end

puts "How old are you? "
age = gets.to_i

puts "Do you want to play? (Y/N)"
answer = gets.strip.capitalize

if answer == "Y" && age >= 18 
	puts "Ok play"
end