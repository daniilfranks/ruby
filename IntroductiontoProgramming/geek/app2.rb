arr = ["den", "io", "jok", "emma" , "alan"]
hash = {:den => "Den", :age => 25, :city => "kazan" }

for object in arr
	puts object
end

for object in hash
	puts object
end

for object in arr.sort.reverse
	puts object
end

x = 0
for object in arr
	x += 1
	puts "#{x}: #{object}"
end


timer = 0
while timer < 5
	timer += 1
	#sleep 1
	puts timer
end

timer = 6
until timer < 1
	timer -= 1
	puts timer
end

hp = 30
loop do
	hp -= 3
	puts "#{hp}"
	break if hp <= 0
end
puts "Game over"


array = [["car","jok"],["rok","sport"]]
array.each{|x| x.each{|y| puts y}}


h = Hash.new(0)
string = "hi ruby i love ruby my name den ruby on rails"
string.split.each do |w|
  h[w] += 1
end

h.each{|key, value| puts "#{key} - #{value}"}


arr = ["a","b","f","aa","c","d"]
arr.sort!{|a,b| b <=> a}
puts arr

arr.sort!{|a,b| b.length <=> a.length}
puts arr


hash = {den: 25, jok: 37, aren: 18, io: 27}
old = hash.select{|key,value| value > 25}
puts old

kv = hash.each{|key,value| puts "#{key} #{value}"}
key = hash.each_key{|key| puts key}
value = hash.each_value{|value| puts value}


books = {First_ruby: {price: 19, rate: 10},
				Second_ruby: {price: 9,  rate: 8},
				Love_ruby:   {price: 10, rate: 9}
}

loop do
	puts ""
	puts "Comands: "
	puts "All books"
	puts "Add book"
	puts "Delet book"
	puts "Update book"
	puts "Rate book"
	puts "Exit"

	loophash = {}

	command = gets.strip.capitalize

	if command == "All books"
		puts ""
		books.each do |key, value|
			puts "#{key}: #{value}"
		end
	elsif command == "Add book"
		puts "Enter the name book"
		hash_name = gets.strip.capitalize.to_sym

		puts "Enter price"
		loophash[:price] = gets.strip

		puts "Enter rate"
		loophash[:rate] = gets.strip

		books[hash_name] = loophash
		puts "Book save!"
	elsif command == "Delet book"
		puts "Enter the name book"
		delet = gets.strip.capitalize.to_sym
		books.delete(delet)
		puts "Book delet!"
	elsif command == "Exit"
		break
	else
		puts "Command is not!"
	end
end