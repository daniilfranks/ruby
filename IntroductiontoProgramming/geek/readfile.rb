f = File.open('write.txt', 'r')
line_count = 0
f.each do |i| 
	line_count += 1
	puts i
end
puts line_count
f.close

#f = File.readlines('write.txt', 'r')
#s = f.scan(/\w+/).length