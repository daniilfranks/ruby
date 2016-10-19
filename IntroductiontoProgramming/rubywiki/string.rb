p "Hi! " * 3
p "Hi" + " World!"

a = "Hello"
b = " World!"

p a << b
p a.concat(b)

p "abc" <=> "ab"
p "abc" <=> "abc"
p "abc" <=> "abcd"

p "abc" == "ab"
p "abc" == "abc"
p "abc" == "abcd"


p "string 1" =~ /\d/
p "string 1" =~ 1

a = "Ruby on Rails"
p a[0]
p a[5,2]
p a[8..12]
p a[-5..-1]

p "hello".capitalize
p "HELLO".capitalize
p "123ABC".capitalize

p "CENTER".center(6)
p "CENTER".center(8)
p "CENTER".center(12)
p "CENTER".center(20, "=")

p "First string.".chomp
p "First string.\n".chomp
p "First string.\n\r".chomp
p "First string spam.".chomp("spam.")
p "First string.".chomp(".")
p "First string".chomp(".")

p "First string.".chop
p "First string.\n".chop
p "First string.\n\r".chop
p "First string.\r\n".chop

p 65.chr
p 50.chr
p 63.chr

i = 1
arr = []
while i < 250
	i += 1
	str = "#{i} #{i.chr}"
	arr << str
end
p arr


a = "String"
p a.clear


a = "hello world"
p a.count("l")
p a.count("lo")

a = "hello world!"
p a.delete("!")

p "HeLLO".downcase


a = "hello world!"
a.each_byte { |i| p i }

"hello".each_char { |i| print i, " " }
puts

"hello".each_char { |i| print i, "-" }
puts

p "hello".empty?
p " ".empty?    
p "".empty?


str = "spam Hi world spam"
p str.gsub(/spam/, "")

str = "12Hi world 2111"
p str.gsub(/\d/, "")

str = "<p>string tag</p>"
p str.gsub(/([<p><\/p>])/, "")

str = "<p>first tag</p> <p>second tag</p>"
p str.gsub(/(<p>)(\w+) (\w+)(<\/p>)/, "")

str = "<p>first tag</p> <p>second tag</p>"
p str.gsub(/(<p>)(second) (\w+)(<\/p>)/, "delete")


p "hello".include?("hello")
p "hello".include?("h")
p "hello".include?("z")


p "hello".index("h")
p "hello".index("e")
p "hello".index("-1")

p "hello".replace("world")

str = "sring"
p str.insert(0, "first ")
p str.insert(-1, " end")

p "str".to_sym


a = "string"
p a.size
p a.length

p a.ljust(6)
p a.ljust(10)
p a.ljust(10,"=")

str = "   string  "
p str.lstrip


p "a".succ
p "z".succ
p "aa".succ
p "a".next
p "z".next
p "aa".next


p "a".ord
p "A".ord
p "1".ord
p "2".ord


p s = "hello"
p s.replace "world"

p "ruby on rails".reverse

p "world".rindex("d")


p "hello".rjust(5)
p "hello".rjust(10)
p "hello".rjust(10, "=")


p "string ".rstrip
p "  string ".rstrip


a = "Hello Ruby on Rails 5.0"
p a.scan(/\d/)
p a.scan(/\w+/)
p a.scan(/\d.\d/)

a = "Hello Ruby on Rails 5.0"
p a.split
p a.split(" ")
p a.split(//)

p "1:2:3".split(/:/)

a = "  Hello    Ruby   on   Rails  5.0 "
p a.squeeze(" ")

p "    hello    ".strip
p "\tgoodbye\r\n".strip


p "hello".sub("l", "*")

p "Hello".swapcase

p 12.to_s
p 12.to_f
p 12.0.to_i
p "string".to_sym

p "string".upcase

1.upto(5) { |i| p i}

p "a7".upto("b7").to_a