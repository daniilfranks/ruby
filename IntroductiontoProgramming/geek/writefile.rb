f = File.new('write.txt', 'a')
puts "Enter you text: "
s = gets
f.write(s)
f.close