review_file = File.new('reviews.txt', 'r')

p review_file.class

lines = review_file.readlines
#puts lines
puts lines[0]
puts lines[3]
puts lines[-1]

review_file.close
puts lines.length


lines = []
File.open('reviews.txt') do |review_file|   
	lines = review_file.readlines 
end 
#puts lines
puts lines.length

=begin
relevant_lines = []

lines.each do |line|
	if line.include?("Truncated")
		relevant_lines << line
	end
end

puts relevant_lines
=end

relevant_lines = lines.find_all { |line| line.include?("Truncated") }
puts relevant_lines


p a = "1-800-122-0002".split("-")
p b = "his/her".split("/")
p c ="apple, avocado, anvil".split(", ")
p a.find_index("800")
p b.find_index("his")
p c.find_index("anvil")


string = lines.first
words = string.split(" ")
p words


def find_adjective(string)   
	words = string.split(" ")   
	index = words.find_index("is")   
	words[index + 1] 
end 

lines = [] 
File.open("reviews.txt") do |review_file|   
 	lines = review_file.readlines 
end 

relevant_lines = lines.find_all { |line| line.include?("Truncated") } 
reviews = relevant_lines.reject { |line| line.include?("--") } 

adjectives = reviews.map do |review|   
	adjective = find_adjective(review)   
	"'#{adjective.capitalize}'" 
end 

puts "The critics agree, Truncated is:" 
puts adjectives 