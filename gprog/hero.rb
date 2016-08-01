puts "Enter name hero"
hero = gets.chomp

hero_antihero = {"hero1" => "antihero1", "hero2" => "antihero2", "hero3" => "antihero3"}

if hero_antihero.has_key?(hero)
	puts "Resault: #{hero_antihero[hero]}"
else
	puts "No hero"
end

