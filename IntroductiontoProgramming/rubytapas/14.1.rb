class Parent
	def hello(subject="World")
		puts "Hello, #{subject}"
		if block_given?
			yield
			puts "Well, nice seeing you!"
		end
	end
end

class Child < Parent
	def hello(subject=:default)
		if subject == :default
			super(&nil)
		else
			super(subject, &nil)
		end
		puts "How are you today?"
	end
end

Child.new.hello(:default) do 
	puts "Hi there, Child!"
end