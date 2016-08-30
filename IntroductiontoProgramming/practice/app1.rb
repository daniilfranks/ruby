arr = []

loop do 
  arr2 = []

  print "Add name: "
  name = gets.strip.capitalize

  if name == ""
    break
  end

  print "Add age: "
  age = gets.to_i

  print "Add city: "
  city = gets.strip.capitalize

  arr2 << name
  arr2 << age
  arr2 << city
  arr  << arr2
end

x = 0
arr.each do |c|
  x += 1
  puts "#{x}. #{c[0]} #{c[1]} #{c[2]} "
end

puts "Total users: #{arr.size}"