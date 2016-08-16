my_file = File.new("test_file.txt", "w+") #flags r, w, w+, a+
my_file.close

File.open("test_file.txt", "w"){|f| f.write("add first text")}

a = File.read("test_file.txt")
puts a

text = File.open("test_file.txt", "w+")
text.puts("Text")
text.close
text = File.read("test_file.txt")
puts text

readlines = File.open("test_file.txt", "a+") do |f|
	f << "New text"
end

File.readlines("test_file.txt").each do |i|
	puts "========"
	puts i
end

File.readlines("test_file.txt").each_with_index do |line, line_num|
	puts "#{line_num+1}: #{line}"
end


File.new("del_file.rb", "w+")
File.delete("del_file.rb")


copyfile = File.read("test_file.txt")
newfile = File.new("newfile.txt", "w+")
File.open(newfile, "a") do |f|
	f.puts copyfile
end

r = File.read(newfile)
puts r