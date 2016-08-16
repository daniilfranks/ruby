def hi
	puts "Hi world"
end
hi

def you_name name="no name", age=0
	puts "You name #{name} #{age}"
end
you_name
you_name("Den", 25)


def array(arr)
	arr.first
end
a = [1,2,3]
p array(a)

