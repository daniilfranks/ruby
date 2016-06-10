class Person
	attr_accessor :name, :age, :gender
end

person_value = Person.new
p person_value.name = "Den"
p person_value.age = 25
p person_value.gender = "m"

name = "Danila"
p name.length
p name.upcase
p name.capitalize
p name.downcase
p "Danila".chop
p name.reverse

5.times do
	p name
end

1.upto(5) do |variable|
	p variable
end

5.downto(1) do |variable|
	p variable
end

0.step(100,10) do |variable|
	p variable
end

string = "Hi world"
p string.scan(/\w/)
p string.scan(/\w/).join(",")

lines = File.readlines("text.txt")
p line_count = lines.size
text = lines.join
p total_characters = text.length
p total_characters_nospaces = text.gsub(/\s+/,"").length
p word_count = text.split.length
p paragraph_count = text.split(/\n\n/).length
p sentence_count = text.split(/\.|\?|!/).length
stopwords = %q{the a by on for of are with just but and to the my I in}
words = text.scan(/\w+/)
p keywords = words.select{|word| !stopwords.include?(word)}.length

File.open("text.txt").each{|line| puts line}

































