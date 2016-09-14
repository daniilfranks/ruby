s = "den"
p s.capitalize

c = "den\r"
p c.chomp

t = "den."
p t.chop

a = 5
p a.class
p 2.to_s

string = "I love spam"
p string.delete "a..c"

d = "WORD"
p d.downcase.capitalize

string = "key word ruby php"
p string.split

"Danila".each_byte { |b| print b, "/" }
puts "\n"

e = ""
p e.empty?

g = "I love ruby. spam"
puts g.gsub("spam", "")

puts g.gsub(/\s+/, "").length

puts g.include? "ruby"

s = "900. Ruby on rails 100$"
p s.scan(/\d+/)
p "Scan method: #{s.scan(/\w+/).length}"