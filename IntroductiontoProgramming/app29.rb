#String
p str = ""
p str = "Name"
p str = "5"
p "HO! " * 3
p "I Love" + " Ruby"
p 5.to_s

name = "Hi "
p name << "Den"

p name[0..6]
p name[0..1]

p "hi".capitalize
p "Center".center(20)
p "Center".center(20, "===")

p "hello".chomp                
p "hello\n".chomp              
p "hello\r\n".chomp 

p a = "clear".clear

c = "Count //"
p c.count("/")
p c.count("c")
p c.count("o")

d = "Delete 23"
p d.delete("23")
p d.delete("Del")

p "doWnCase".downcase

"Den".each_byte {|c| p c}

"Den".each_char {|c| print c, " "}

p "Den".empty?
p " ".empty?
p "".empty?


p "Den".eql?("Den")

a = "a"
b = "b"
p a.eql?(b)


g = "gsub"
puts g.gsub(/[g,u]/, "*")

p "string".include? "string"

p "Den".index("e")

p = "Php"
p p.replace("Ruby")

i = "nsert"
p i.insert(0, "I")

p "Den".length
p "Den ".size

p "   Den ".strip

p "olleH".reverse

p "hi".rjust(20)
p "hi".ljust(20)

s = "Key words"
p s.scan(/\w+/)
s.scan(/\w+/){|i| print "-#{i}- "}

p s.split

n = "1 12,3 car tor"
p n.split