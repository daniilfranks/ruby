def names
	yield "Den"
	yield "Jok"
	yield "Leo"
	yield "Ash"
ensure
	puts "Grimm"
end

result = names do |name|
	puts name
	break if name =~ /^L/
end

p result