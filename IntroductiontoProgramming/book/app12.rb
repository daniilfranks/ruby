class Person
	def initialize(name)
		set_name(name)
	end

	def name
		@first_name + ' ' + @last_name
	end

	def set_name(name)
		first_name, last_name = name.split(/\s+/)
		set_first_name(first_name)
		set_last_name(last_name)
	end

	def set_first_name(name)
		@first_name = name
	end

	def set_last_name(name)
		@last_name = name
	end
end

p = Person.new("Den Babanov")
puts p.name
p.set_last_name("Newname")
p.set_first_name("Firstname")
puts p.name


class Animal
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def to_s
		"#{@name}"
	end
end

class Cat < Animal
	def talk
		puts "Meaow!"
	end
end

class Dog < Animal
	def talk
		puts "Woof!"
	end
end

animals = [Cat.new("Jok"), Dog.new("Clive"), Cat.new("Max")]
animals.each do |a|
	puts a
	puts a.talk
end

my_arr = %w{danila jok denis io jaroslav}
longest_word = ''
my_arr.each do |word|
	longest_word = word if longest_word.length < word.length
end
puts longest_word

my_arr = %w{10 24 43 435 12}
highest_number = 0
my_arr.each do |number|
	number = number.to_i
	highest_number = number if number > highest_number
end
puts highest_number


my_arr = (1..10).to_a
my_arr.select! { |i| i.odd? }
p my_arr

