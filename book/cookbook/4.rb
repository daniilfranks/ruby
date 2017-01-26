array = [1,2,3,4,5]

i = 0
array.each do |k| 
	i += 1
	#p "Index: #{i}, Value: #{k}" 
end

array.each_with_index do |v, k|
	#p "Index: #{k+1}, Value: #{v}"
end

#array.collect { |i| p i * 2 }
#array.map { |i| p i * 2 }

array = ['php', 'c#', 'ruby', 'java']
#array.map { |i| p i.capitalize }


array     = [1,2,3,4,5]
new_array = []
index     = 0

back_index = array.size-1

while index <= back_index
	new_array << array[index]
	index += 1
end

p new_array.sample(new_array.size)


open('first.txt', 'w') do |file|
	file.puts('First text')
	file.puts('Second text')
end

open('first.txt').each { |i| puts i }









