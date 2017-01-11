require 'json'
require 'ostruct'

hash = { 1 => { name: 'Danila', age: 25 }, 2 => { name: 'Leon', age: 30 },
				 3 => { name: 'Ash', age: 19 }
				}

hash2 = { 5 => { name: 'Jok', age: 27 }, 6 => { name: 'Gleb', age: 23 },
				  7=> { name: 'Karbon', age: 32 }
				}

# Hash convert JSON
users = hash.to_json
users.to_json

# Read JSON
# user = JSON.parse(users, object_class: OpenStruct)
# p user['1'].name
# p user['1'].age

# Add new user
user = JSON.parse(users)
p idhash = user.size + 1

adduser = { name: 'BOSS', age: 100, city: 'London' }

user.merge!( idhash.to_s => adduser )
p user
p '*'*45

# Add new hash
user.merge!(hash2)
p user
p '*'*45

#Write file
#file = File.new('json4.json', 'w')
#file.write(JSON.generate(user))
#file.close

#Read file
#file = File.read('json4.json')
#user = JSON.parse(file, object_class: OpenStruct)
#p user['1']

hash4 = { 1 => { name: 'Danila', age: 25 } }
hash5 = { 2 => { name: 'Karbon', age: 32 } }

def write_json(filename, hash)
	unless File.exist?(filename)
		file = File.new(filename, 'w')
	else

		#file = File.read(filename)
		#file_json = JSON.parse(file)
		#p file_json
		#file_json.merge!(hash)
		#file = File.new(filename, 'w')
		#file.write(JSON.generate(file_json))
	end
end

def read_json(filename)
	file = File.read(filename)
	JSON.load(file, symbolize_names: true)
end

#write_json('json4.json', hash4)
#read_json('json4.json')

