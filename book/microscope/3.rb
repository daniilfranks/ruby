hash = {}
p hash
p hash.class

#hash[1] = '1'
#hash[2] = '2'

#create
hash = { users: {} }
hash[:users][1] = { name: 'Den', age: 25 }
hash[:users][2] = { name: 'Leo', age: 31 }
hash[:users][3] = { name: 'Del', age: 19 }
hash[:users][4] = { name: 'Update', age: 100 }

#search
p hash[:users].include?(1)
p hash[:users].assoc(1)

# delete
hash[:users].delete(3)
p hash

#update
id = 4
new_name = nil
new_age = 40
update = hash[:users].assoc(id)
name = new_name.nil? ? update[1][:name] : new_name
age = new_age.nil? ? update[1][:age] : new_age
hash[:users][id] = { name: name, age: age }

#show
hash.each do |k, v|
	v.each do |k, v|
		puts "Key: #{k}"
			v.each do |k, v|
				puts v
			end
	end
end
