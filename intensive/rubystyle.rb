def some_method
  puts 'Hello'
end

some_method

def get_hello(name)
  puts "Hello #{name}."
end

get_hello('Den')

puts 'foo', 'bar'

number = 1 + 2
p number

3**12

arr = (1..10).to_a
arr.each { |i| p i }

number = 15
rating =
  case number
  when 0..10  then 'User'
  when 11..20 then 'Moderator'
  when 21..30 then 'Admin'
  else 'No rating!'
  end

p rating

def default(arg1 = :default, arg2 = nil, arg3 = [])
  puts "#{arg1}, #{arg2}, #{arg3}"
end

hash = {
  key1: 10,
  key2: 20,
  key3: 30
}

menu_item =
  ['Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam',
   'Baked beans', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam']

p hash
p menu_item

p 1_000
p 1_000_000

def default_methods(c, d, a = 1, b = 4)
  puts "#{a}, #{b}, #{c}, #{d}"
end

default_methods('a', 'b', 'c', 'd')

a = 1
b = 2
a, b = b, a
p a, b

arr = ['Java', 'Php', 'C#']
a, *b = arr
puts a, b

age = 25
result = age >= 18 ? 'Access' : 'Denied'
puts result

x = 0
while x < 5
  x += 1
  puts x
end

name ||= 'Default'
p name

enable = true if enable.nil?
p enable

something = 'Den'
something &&= something.downcase
p something

l = ->(a, b) { puts a + b }
l.call(1, 2)

l = lambda do |a, b|
  tmp = a * 7
  p tmp * b / 50
end

l.call(10, 20)

x = 1001
p 'true' if (1000..2000).include?(x)

[0, 1, 2, 3].each do |item|
  next unless item > 1
  puts item
end

salary = 1_000