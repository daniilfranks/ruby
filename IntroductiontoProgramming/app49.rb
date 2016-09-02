class Animal
	def initialize name
		@name = name
	end

	def self.say_hi
		puts "Hi"
	end

	def run
		puts "#{@name} run"
	end

	def jump
		eat
		puts "#{@name} jump"
		sleep
	end

	private
	def eat
		puts "I am eating"
	end

	def sleep
		puts "i am sleeping"
	end
end

class Cat < Animal
	def initialize
		super 'cat'
	end
end

class Dog < Animal
	def initialize
		super 'dog'
	end
end

cat = Cat.new
cat.run

dog = Dog.new
dog.jump
#dog.eat
#dog.sleep

Animal.say_hi
Cat.say_hi
Dog.say_hi