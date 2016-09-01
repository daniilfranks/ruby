@hash = {}

def add_hash options
	puts 'Already exists!' if @hash[options[:name]]
	@hash[options[:name]] = options[:age]
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

	add_hash :name => name, :age => age
end

show_hash