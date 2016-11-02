def user_name(params)
	params.fetch(:username)
end

def greet(params)
	name = user_name(params) rescue "Anonymous"
	puts "Hello, #{name}"
end

p greet({})