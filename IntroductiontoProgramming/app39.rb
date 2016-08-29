hash = {:name => ['Den'], :phone => [8234325,3485345], :adres => ['centr 12/34']}
puts hash

hash.each{|key,value| puts "#{key}: #{value}"}
hash.each_key{|key| puts "#{key}"}
hash.each_value{|value| puts "#{value}"}

x = 0
hash.each_value do |value|
	x += value.size
	puts "#{value}"
end
puts x

p hash.key? :name
p hash.key? :city
p hash.value? ['Den']