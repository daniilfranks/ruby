arr = ["Den","Leo","Anna","Io","carl"]

i = 0
arr.each do |name|
	i += 1
	puts "#{i}. #{name}"
end

p arr[1..2]

arr.last.capitalize!
puts arr

puts arr[1..3][2]

name = ["a","b","c","d","e","f","g"]
name.delete_at(1)
name.delete("d")
p name