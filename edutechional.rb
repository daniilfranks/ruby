p name = "Den"
p address = ["Kazan", "Mira 12"]

=begin
p "What is you name?"
name = gets.chomp

if name == "Den"
	p true
else
	p false
end
=end

p "text".upcase
p "Text".downcase
p "text".reverse

str = "  Hi world spam   "
p str.gsub "spam",""
p str.strip
p str.size
p str.split.size

=begin
class Test
	def self.one
		p "one"
	end

	def two
		p "two"
	end
end

a = Test.new
Test.one
a.two
=end

i = 0
while i < 10
	i += 1
	puts "Hi Ruby"
end

arr = [12,14,34,67,89]
arr.each do |i|
	p i
end

for i in 0..10
	p i
end

(1..10).to_a.select {|x| x.even?}
(1..10).to_a.select do |x|
	x.even?
end

arr = %w(The quick brown fox over the lazy dog)
arr.select {|x| x.length > 5}

["1","2.0","77"].map{|x| p x.to_i}
("a".."g").to_a.map{|i| p i*2}
total = 0
[12,45,23,74].each do |i|
	 total += i
end
p total

p [12,45,23,74].inject(&:+)
p [12,45,23,74].inject(&:*)

arr = ["one","two","true"]
p arr.join(",")

people ={den: 322, oleg: 12, climent: 94}
p people[:den]
people.delete(:oleg)
p people

people.each_key do |key|
	puts key
end

=begin
class ApiConnector
	attr_accessor :title, :description, :url

	def test_method
		puts "testing class call"
	end
end

api = ApiConnector.new
p api.url = "google.com"
api.test_method
=end

arr = ["index.html", "index.rb","hi.rb"]
p arr.select{|x| x =~ /\.rb/}.map{|x| x[0..-4]}
p arr.grep(/(.*)\.rb/){$1}

class String
	def censor(bad_word)
		self.gsub! "#{bad_word}", "CENSORED"
	end

	def num_of_chars
		size
	end
end

p "Bad post idiot".censor("idiot")
p "Hi world".num_of_chars