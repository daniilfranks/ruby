table = {"H" => "Hydrogen", "Li" => "Lithium", "Be" => "Beryllium", "Na" => "Sodium",}

puts "Elements: #{table.keys.size}"
puts table.keys

element = gets.chomp

if table.key?(element)
	puts "#{table[element]}"
else
	puts "No element"
end