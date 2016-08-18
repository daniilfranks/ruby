10.times do |i|
	r = rand(1..10)
	puts "#{i+1}: #{r}"
end

10.times{p rand 10}

5.times{p rand(1...5)}
5.times{p rand(0.03..0.05)}

10.times do
	print "Boban "
	sleep rand(0.01..1)
end

300.times{print rand(30-120).chr}
