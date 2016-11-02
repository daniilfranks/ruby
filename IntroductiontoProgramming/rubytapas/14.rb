class Parent
	def hello(subject="World")
		puts "Hello, #{subject}"
	end
end

class Child < Parent
	def hello(subject)
		super
		puts "How are you today?"
	end
end

Child.new.hello("Bob")