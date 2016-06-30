counter = 1
while counter < 11
  puts counter
  counter += 1
end

counter = 1
until counter == 11
  puts counter
  counter += 1
end

for num in 1...10
  puts num
end

for num in 1..15
  puts num
end

i = 20
loop do
  i -= 1
  print "#{i}"
  break if i <= 0
end

i = 20

loop do
i -= 1
next if i % 2 ==1
print "#{i}"

break if i <=0
end

array = [1,2,3,4,5]

array.each do |x|
  x += 10
  print "#{x}"
end

odds = [1,3,5,7,9]

odds.each do |odds|
   odds*=2
   print odds 
end

10.times { print "Chunky bacon!" }

i = 1
while i < 11 do
    print i
    i += 1
end

i = 1
until i > 10 do
    print i
    i += 1
end

for i in 1..10 do
    print i
end

i = 0
loop {
    i += 1
    print "Ruby!"
    break if i >= 10
    }