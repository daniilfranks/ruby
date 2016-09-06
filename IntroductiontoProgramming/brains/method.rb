def hi_name name
	puts "Hi #{name}"
end

hi_name "Den"
hi_name "Jok"



def get_users name="No name", second_name="No second name"
	puts "#{name} #{second_name}"
end

get_users "Den", "Babanov"
get_users "Oleg"
get_users



def get_nilstring name="", age=""
	unless name =="" && age ==""
		puts "#{name}, #{age}"
	end
end

get_nilstring
get_nilstring "Den", 25
get_nilstring



def get_hi name="", age=""
	hiworld = "Hi world\n"
	unless name =="" && age ==""
		hiworld += "#{name}, #{age}"
	end
	return hiworld
end

puts get_hi
puts get_hi "Den", 25