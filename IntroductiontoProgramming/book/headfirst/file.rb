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
