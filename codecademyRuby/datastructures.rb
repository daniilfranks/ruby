demo_array = [100, 200, 300, 400, 500]
p demo_array[2]

string_array = ["ggg", "rrr", "rrr"]

multi_d_array = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
multi_d_array.each { |x| puts "#{x}\n" }

my_2d_array = [[1, false], ["dog","cat"]]

my_hash = { "name" => "Eric",
  "age" => 26,
  "hungry?" => true
}

puts my_hash["name"]
puts my_hash["age"]
puts my_hash["hungry?"]

pets = Hash.new
pets = {"Stevie" => "cat"}
puts pets["Stevie"]

friends = ["Milhouse", "Ralph", "Nelson", "Otto"]

family = { "Homer" => "dad",
  "Marge" => "mom",
  "Lisa" => "sister",
  "Maggie" => "sister",
  "Abe" => "grandpa",
  "Santa's Little Helper" => "dog"
}

friends.each { |x| puts "#{x}" }
family.each { |x, y| puts "#{x}: #{y}" }

languages = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
languages.each{|l| puts l}

s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]

s.each do | x |
  x.each do | y |
    puts y
  end
end

secret_identities = {
  "The Batman" => "Bruce Wayne",
  "Superman" => "Clark Kent",
  "Wonder Woman" => "Diana Prince",
  "Freakazoid" => "Dexter Douglas"
}

secret_identities.each {|key, value| puts "#{key}: #{value}"}

my_array = [[1], [2]]
my_hash = { :a => "b"}

lunch_order = {
  "Ryan" => "wonton soup",
  "Eric" => "hamburger",
  "Jimmy" => "sandwich",
  "Sasha" => "salad",
  "Cole" => "taco"
}

puts lunch_order.each { |a, b| puts "#{b}"