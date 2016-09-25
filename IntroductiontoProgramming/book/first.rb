class User
	attr_accessor :name, :age
	def initialize(name, age)
		@name = name
		@age = age
	end

	def to_s
		"Name: #{@name} Age:#{@age}"
	end
end

den = User.new("Den",25)
puts den

jok = User.new("Error",1000)
puts jok
jok.name = "Jok"
puts jok.name
jok.age = 31
puts jok.age
puts jok


string = "Hello world!"
p string.object_id
p string.capitalize
p string.upcase
p string.reverse
p string.downcase

p arr = string.split("")
arr.delete " "
p arr

p string.split(" ")

p string.chop
p string.chomp
p string.strip


reg = "28.02.1991 Hi bro. 99.99 I love ruby 100!"
p reg.scan(/\d/)
p reg.scan(/\d{2}.\d{2}.\d{4}/)
p reg.scan(/\w+/)

p (1..5).to_a
p ("a".."e").to_a
p ("aa".."ee").to_a

array = [["den",25,"Kazan"],["jok",37,"Omsk"],["aren",29]]
p array[0]
p array[1]

array.each{ |arr| puts "Name:#{arr[0]} Age:#{arr[1]} City:#{arr[2]}" }


arr = [1,2,3,4,5]

for i in arr do
	puts i
end