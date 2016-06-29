#BEGINNING RUBY
p 1+1
5.times do p "Hi bro" end
p 10/3
p 10.0/3

class Pet
	attr_accessor :name, :age, :gender, :color
end

class Cat < Pet
end

class Dog < Pet
	def bark
		puts "Woof!"
	end
end

class Snake < Pet
	attr_accessor :length
end

snake = Snake.new
p snake.name = "Sammy"
p snake.length = 500
lassie = Dog.new
p lassie.name = "Lassie"
p lassie.age = 10
dog_woof = Dog.new
dog_woof.bark

string = "Test"
p string.length
p string.capitalize
p string.downcase
p string.chop
p string.next
p string.reverse
p string.sum
p string.swapcase
p string.upcase

p 2+3
p "1"+"2"
x = 10
p x

age = 21
p "Access" if age < 25
p "Access" unless age < 25
p "Access" if age == 25
p "Access" if age <= 25
p "Access" if age != 25

x = 1
x += 1
p x

2.times { puts "Times"}
1.upto(3) {puts "Upto"}
1.upto(3) {|x| puts x}
x = 10
y = 3
p x.to_f / y.to_f
p 5.7.to_i

p "I love Ruby".sub("Ruby", "PHP")
p "I love Ruby spam".sub("spam", "")
p "I love Ruby".sub(/^../, "You ")
"This is a test 1000".scan(/./) {|x| puts x}
puts "=============================="
"This is a test 1000".scan(/../) {|x| puts x}
puts "=============================="
"This is a test 1000".scan(/\w\w/) {|x| puts x}
puts "=============================="
"This is a test 1000".scan(/\d/) {|x| puts x}
puts "=============================="
"This is a test 1000".scan(/\d+/) {|x| puts x}
puts "=============================="
"This is a test 1000".scan(/\d+/) {|x| puts x}
puts "=============================="
p "This is a test 1000".scan(/\w/).join(",")
puts "=============================="
puts "This is a test, 1000".split(/\s+/).inspect
puts "=============================="

x = [1,2,3,4,5]
p x[0]
p x[-1]

y = []
y << "Word"
y << "Play"
y << "Fun"
puts y
p y.pop
p y.length
p y.join
p y.join(",")
p y.empty?
p y.include?("Word")
p y.first
p y.last

p x.first(3).join("-")
p x.reverse

car = {"kia" => "ceed", "bmw" => "x5"}
p car.size
p car["kia"]
car.each{|key, value| puts "#{key} #{value}"} 
p car.keys
p car.values

z = {"a" => 12, "b" => 54, "d" => 89,}
z.delete_if{|key, value| value < 50 }
p z

people = {
	1 => {
		"name" => "Den",
		"age" => 25,
		"gender" => "male",
		"favorite_painters" => ["Monet", "Constable", "Da Vinci"]
	},
	2 => {
		"name" => "Janet",
		"age" => 31,
		"gender" => "female"
	}
}

p people[1]
p people[2]["name"]
p people[1]["favorite_painters"].join(", ")

age = 10
p "Denied" if age < 18
p "Access" if age <= 10

score = 17
	if score < 21
		puts "2 lvl"
		if score >= 18
			puts "1 lvl"
		end
	end

age = 10
if age < 18
	type = "child"
else
	type = "adult"
end
puts "You are a #{type}"

age = 10
unless age >= 18
	puts "Denied"
end

1.upto(5){|i| puts i}

x = 1
while x < 100
	puts x
	x = x * 2
end

x = [1,2,3]
x.each{|y| puts y}

p Time.now
p Time.now - 10
p Time.now + 86400

("A".."Z").to_a.each{|i| print i}
a = [2,3,4,5,8,10,12]
p a[1..3]

person1 = {:name => "Den", :age => 25, :gender => :male}
person2 = {:name => "Laure", :age => 23, :gender => :female}
p person1[:name]

line_count = 0
File.open("text.txt").each{|i| line_count += 1}
puts line_count

lines = File.readlines("text.txt")
line_count = lines.size
text = lines.join
word_count = text.split.length
character_count = text.split.length
character_count_nospaces = text.gsub(/\s+/, '').length
paragraph_count = text.split(/\n\n/).length 
sentence_count = text.split(/\.|\?|!/).length

puts "#{line_count} lines"
puts "#{word_count} words"
puts "#{character_count} character"
puts "#{character_count_nospaces} characters excluding spaces" 
puts "#{paragraph_count} paragraphs" 
puts "#{sentence_count} sentences"


text = %q{Los Angeles has some of the nicest weather in the country.} 
stopwords = %w{the a by on for of are with just but and to the my in I has some}
words = text.scan(/\w+/) 
keywords = words.select { |word| !stopwords.include?(word) }
puts keywords.join(' ')











