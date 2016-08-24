#Integer
p "2".to_i

p 1.chr

=begin
i = 1
while i < 10
	i += 1
	print i.chr
end
=end

p 1.denominator

3.downto(1){|i| puts i, "... "}

1.upto(3) do |i|
	puts i
end

p 11.even?
p 12.even?

p 8.odd?
p 9.odd?

p 11.integer?
p 11.5.integer?

p 1.next
p 5.pred

2.times{p "Hi"}

10.times do |i|
	i.times do
		print "!"
	end
	puts
end