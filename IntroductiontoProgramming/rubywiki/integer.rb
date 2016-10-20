puts 65.chr
puts 90.chr
puts 91.chr
puts 45.chr

puts "a".ord
puts "A".ord
puts "1".ord
puts "9".ord
puts "-".ord
puts "+".ord

p 1.odd?
p 2.even?
p 3.odd?
p 4.even?

1.upto(3) { |i| p i }

5.downto(1) { |i| puts i }

3.times { puts "Hi ruby" }
3.times { |i| puts "#{i} Hi ruby" }

p 10.99.to_i