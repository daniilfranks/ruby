def prime(n)
  puts "That's not an integer." unless n.is_a? Integer
  is_prime = true
  for i in 2..n-1
    if n % i == 0
      is_prime = false
    end
  end
  if is_prime
    puts "#{n} is prime!"
  else
    puts "#{n} is not prime."
  end
end

prime(2)
prime(9)
prime(11)
prime(51)
prime(97)

def puts_1_to_10
  (1..10).each { |i| puts i }
end
puts_1_to_10

def array_of_10
  puts (1..10).to_a
end
array_of_10

def cubertino(n)
  puts n ** 3
end
cubertino 8

def what_up(greeting, *bros)
  bros.each { |bro| puts "#{greeting}, #{bro}!" }
end
 
what_up("What up", "Justin", "Ben", "Kevin Sorbo")

def add(optional, parameters)
  return optional + parameters
end

def greeter(name)
  return "hi #{name}"
end

def by_three?(number)
  if number % 3==0
    return true
  else
    return false
  end
end

1.times do
  puts "I'm a code block!"
end

1.times { puts "As am I!" }

def capitalize(string) 
  puts "#{string[0].upcase}#{string[1..-1]}"
end

capitalize("ryan") 
capitalize("jane") 

["ryan", "jane"].each {|string| puts "#{string[0].upcase}#{string[1..-1]}"}

[1, 2, 3, 4, 5].each { |i| puts i }
[1, 2, 3, 4, 5].each { |i| puts i * 5 }

my_array = [3, 4, 8, 7, 1, 6, 5, 9, 2]
p my_array.sort!

books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia", "A Brief History of Time", "A Wrinkle in Time"]
books.sort!

book_1 = "A Wrinkle in Time"
book_2 = "A Brief History of Time"
book_1 <=> book_2


books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia", "A Brief History of Time", "A Wrinkle in Time"]
# To sort our books in ascending order, in-place
books.sort! { |firstBook, secondBook| firstBook <=> secondBook }
# Sort your books in descending order, in-place below
books.sort! { |firstBook, secondBook|  secondBook <=> firstBook }

def welcome
  puts "Welcome to Ruby!"     
end
welcome

def welcome(name)
    return "Welcome to Ruby, #{name}!"     
end
welcome("Den")

my_array = [1, 2, 3, 4, 5]
my_array.each{|i| puts i * i}

fruits = ["orange", "apple", "banana", "pear", "grapes"]
fruits.sort!{|a, b| b <=> a}