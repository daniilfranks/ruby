@hash = {}

def add_hash name, age
	puts 'Already exists!' if @hash[name]
	@hash[name] = age
end

def show_hash
	@hash.each {|key, value| puts "Name: #{key}. Age:#{value}" }
end

loop do 
	print "Enter name: "
	name = gets.strip

	if name == ""
		break
	end

	print "Enter age: "
	age = gets.to_i

	add_hash name, age
end

show_hash