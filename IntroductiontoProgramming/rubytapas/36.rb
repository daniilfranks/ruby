greeter_p = proc do |name|
	puts "Hello, #{name}"
end

p greeter_p
greeter_p.call("Den")
greeter_p.call("Alex")


greeter_l = lambda do |name|
	puts "Hello, #{name}"
end

p greeter_l
greeter_l.call("Jok")
greeter_l.call("Io")


def context
	l = lambda do 
		puts "In lambda"
		return
		puts "After return"
	end

	p = proc do 
		puts "In proc"
		return
		puts "After return"
	end

	l.call
	p.call

	puts "End of method"
end

p context


greeter_l = ->(name) {
	puts "Hello, #{name}"
}

p greeter_l


def each_child(visitor)
	visitor.call("Den")
	visitor.call("Jok")
	visitor.call("Lily")
end

each_child(->(name) {puts "Hello, #{name}!" })