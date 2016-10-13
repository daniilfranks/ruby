post_id = 12
puts :"post_#{post_id}"
puts :post_12

class Greeter
	def hello
		puts "hello world!"
	end
end

greeter = Greeter.new
m = greeter.method(:hello)
m.call


auth = {
	uid: 12345,
	info: {
	}
}

email = auth[:info].fetch(:email){'anon@exam.com'}
p email


a = [:x,:y,:z]
p a.fetch(3){:r}

port = ENV.fetch('PORT'){8080}.to_i
p port


module YeOlde
	def hello(subject="World")
		if defined?(super)
			puts super
		else
			puts "Good morrow, #{subject}!"
		end 
		puts "Well met indeed!"
	end
end

class Greeter
	def hello(subject)
		puts "Hello, #{subject}"
	end
end

class GreeterChild < Greeter
	include YeOlde
end

class NonGreeter
	include YeOlde
end


GreeterChild.new.hello("Bob")
NonGreeter.new.hello("Sally")