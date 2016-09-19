class Bird   
	def talk     
		puts "Chirp! Chirp!"   
	end  

	def move(destination)     
		puts "Flying to the #{destination}."   
	end 
end 

class Dog   
	attr_accessor :name, :age

	def report_age
		"#{@name} #{@age}"
	end

	def talk     
		"#{@name}" 
	end 

	def move(destination)     
		"#{@name} runs to the #{destination}."   
	end 
end 

class Cat   
	def talk     
 		puts "Meow!"   
 	end  

 	def move(destination)     
 		puts "Running to the #{destination}."   
 	end 
end 

bird = Bird.new 
dog = Dog.new 
cat = Cat.new 
bird.move("tree") 
bird.talk 
cat.move("house")

dog.name = "Rex"
dog.age = 3
p dog.talk
p dog.report_age
p dog.move("test")