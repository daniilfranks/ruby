a = 1
b = 2
a,b = b,a
p a,b

a = a+b
b = a-b
a = a-b
#==========================================================

arr = ["den","jok","anna","frodo"]
arr.each_with_index do |name,i|
	puts "#{i+1}. #{name} "
end

options = {:fotn_size => 10, :font_family => "Arial"}
options[:name] = "Den"
puts options
puts options[:font_family]

#===========================================================
hash = {}

loop do
	puts "Add name"
	name = gets.strip.capitalize

	if name == ""
		break
	end

	puts "Add phone number"
	phone = gets.strip.to_i

	hash[name] = phone

end

hash.each do |key, value|
	puts "#{key} #{value}"
end