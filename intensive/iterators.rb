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



i = 1
while i < 11
  print "#{i} "
  i += 1
end
puts ''


i = 1
rand = rand(10)
while i < rand
  print "#{i} "
  i += 1
end
puts ''

names = ['den', 'jok', 'bob', 'alex', 'leo']
i = 0
while i < names.length
  puts names[i]
  i += 1
end
puts ''


names = ['den', 'jok', 'bob', 'alex', 'leo']
i = 0
while i < names.length
  arr = []
  arr << names[i] if i.odd?
  puts arr
  i += 1
end
puts ''