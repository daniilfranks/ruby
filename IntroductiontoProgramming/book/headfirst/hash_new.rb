=begin
ines = []
File.open("votes.txt") do |file|
	lines = file.readlines
end

votes = {}

lines.each do |line|
	name = line.chomp
	if votes[name]
		votes[name] += 1
	else
		votes[name] = 1
	end
end

p votes
=end


lines = [] 
File.open("votes.txt") do |file|   
	lines = file.readlines 
end 

votes = Hash.new(0) 
lines.each do |line|   
	name = line.chomp 
	name.upcase!  
	votes[name] += 1 
end 
 
votes.each do |k,v|
	puts "#{k}: #{v}"
end


def volume(options)
	options[:width] * options[:height] * options[:depth]
end

result = volume(width: 10, height: 5, depth: 2.5)
puts result

class Candidate
	attr_accessor :name, :age, :occupation, :hobby

	def initialize(name, age:, occupation: nil, hobby: nil)
		self.name = name
		self.age = age
		self.occupation = occupation
		self.hobby = hobby
	end
end

carl = Candidate.new("Carl Barnes", age: 46, occupation: "Attorney")
p carl
p carl.name
p carl.age
p carl.occupation
p carl.hobby