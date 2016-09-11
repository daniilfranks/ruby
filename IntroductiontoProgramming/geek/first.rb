age = 18
puts "No exit!!" if age < 21

3.times{|i| puts "#{i+1} Times"}

1.upto(3){|i| puts "#{i} Love ruby"}

3.downto(1){|i| puts "#{i} Hi world"}

x = 0
while x < 5 do 
	x += 1
	puts x
end


string = "My name is Barry Allen and I'm the fastest man alive. 100%"
p string.gsub("Barry Allen","Ashot Polasvili")
p string.gsub(/^../, "first")
p string.scan(/\d/)
p string.scan(/\w/).join("-")
p string.split(/\s/)

arr = [1,2,3,4,5]
arr.each{|i| puts i*100}
arr.each{|i| puts i+10}
arr.collect{|i| puts i*3}

user = {
	:id1 => {:name => "den", :age => 25, :score => 0, :favourite_hero => ["Flash", "Batman", "Thor"] },
	:id2 => {:name => "robert", :age => 31, :score => 0, :favourite_hero => ["Iron man", "Jok", "Dron"] }
}

p user[:id1]
p user[:id2][:name]
p user[:id1][:favourite_hero]
user[:id2][:favourite_hero].each{|i| puts i}
user[:id1].each do |key,value|
	puts "#{key}: #{value}"
end

p user[:id1][:score]
p user[:id1][:score] = 10
user_score = 0
user_score += 10
user_score += 16
user[:id1][:score] = user_score
p user[:id1][:score]
p user[:id2][:score]

a = :a
b = :b
c = :c
d = 4

p a = b
p b == a
p c === d

("a".."z").each {|s| print s}
puts "\n"

a = []
b = {}
c = 1
d = 1.5
e = 10000000000
f = :symbol
g = 'string'
p a.class
p b.class
p c.class
p d.class
p e.class
p f.class
p g.class

p 10**4
p 16%9
p 100%33

p String(1)
p Integer("2")
p Float(5)

