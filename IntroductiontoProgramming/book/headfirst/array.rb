array = [1.34, 2.23, 3.56, 4.98, 5.23, 6.43, 7.89, 8.88, 9.12, 10.18]
p array
p array.class
#p array.methods
p array.find_index(5.23)
p array[4]
p array.length


string = "Test word. I love ruby on rails!!!"
a = string.split
p a
p a.length

b = string.chars
b.delete(" ")
p b
p b.length


index = 0

while index < array.length
	puts array[index]
	index += 1
end

