#File.open('text.txt').each { |i| puts i }

line = 0
File.open('text.txt').each { |i| line += 1 }
#puts line

line = File.readlines('text.txt')
line_count = line.size
text = line.join

#puts line_count
#puts text

#puts text.size
#puts text.split.join.size
#puts text.split.size
#puts text.split(/\n\n/).size

class Square
	def self.test_method
		'Self Test method'
	end

	def test_method
		'Test method'
	end
end

p Square.test_method
p Square.new.test_method
