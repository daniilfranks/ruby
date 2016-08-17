5.times do |i|
	puts i+1
end

5.times{|i| puts i+1}

5.times{|i| puts "#{i+1}: Hi ruby"}

5.times do |i| 
	r = rand(1..100) 
	puts "#{i+1}: #{r}"
end

x = 120
y = 0
5.times do |i|
	y += x
	puts "#{i+1}. #{y}"
end