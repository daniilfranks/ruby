def say_hi name
	puts "Hi #{name}"
end

say_hi "den"



hash = {:name => "Den", :age => "25", :city => "Kazan"}

def puts_details hash
	puts hash[:name] if hash[:name]
	puts hash[:age] if hash[:age]
	puts hash[:city] if hash[:city]
end

puts_details hash