# loop { puts 'Hello world' }

i = 0
loop do 
  i += 1
  print "#{i} "
  break if i == 10
end
puts ''

i = 0
loop do
  i += 1
  next if i == 5
  print "#{i} "
  break if i == 10
end
puts ''

i = 0
loop do
  i += 1
  print "#{i} "
  break puts 'Hello' if i == 10
end


i = 0 
number = 10
loop do
  rand = rand(100)
  i += 1
  puts "#{i}) #{rand}"
  break if number == rand
end

