=begin
x = 0
while x < 10
	puts x += 1
end
=end

=begin
a = "Y"

while a == "Y"
	print "Y/N "
	a = gets.strip.capitalize
	puts "Go"
end
=end

p "Name".reverse

(1..3).each{|x| p x}
(1...3).each{|x| p x}
(-2..2).each{|x| p x}
("a".."c").each{|x| puts x}
("aa".."cc").each{|x| puts x}
("1a".."3c").each{|x| puts x}