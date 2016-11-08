i = 0
while true
	puts "interation #{i}"
	break if i >= 2
	i += 1
end

=begin
def names
	yield "Den"
	yield "Jok"
	yield "Leo"
	yield "Ash"
end

names do |name|
	puts name
	break if name =~ /^L/
end
=end

def names
	yield "Den"
	yield "Jok"
	yield "Leo"
	yield "Ash"
ensure
	puts "Grimm"
end

names do |name|
	puts name
	break if name =~ /^L/
end