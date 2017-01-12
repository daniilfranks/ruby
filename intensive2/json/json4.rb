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

#hash4 = { 1 => { name: 'Danila', age: 25 } }
#hash5 = { 2 => { name: 'Karbon', age: 32 } }

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

#p loc1 = {"longitude" => "2.13012", "latitude" => "48.8014"}
#p loc2 = {"longitude" => "-90.556", "latitude" => "41.0634"}

#p loc1_json = loc1.to_json
#p loc2_json = loc2.to_json

#p loc1_2_json = loc1_json + loc2_json

#p JSON[([loc1_json, loc2_json]).to_json]

#p JSON[([loc1_json, loc2_json]).to_json].map{ |s| JSON[s] }

#p array_json = [loc1_json, loc2_json].map{ |s| JSON[s] }.to_json

#p JSON[array_json]

#hash = { 1 => { name: 'Danila', age: 25 } }
#hash2 = { 2 => { name: 'Karbon', age: 32 } }
#file = File.open('json4.json', 'w')
#file.write(JSON.generate(hash))

#unless File.exist?('json4.json')
#	file = File.new('json4.json', 'w')
#end

#file = File.read('json4.json')
#file_json = JSON.parse(file)
#new_json = hash2

#json = [file_json, new_json].map{ |s| JSON[s] }.to_json
#result_json = JSON[json]
#p result_json
#file = File.new('json4.json', 'w')
#file.write(JSON.generate(result_json))

#file = File.read('json4.json')
#file_json = JSON.parse(file)
#p file_json


#hash = { 1 => { name: 'Danila', age: 25 } }
#hash2 = { 2 => { name: 'Karbon', age: 32 } }
#file = File.open('json4.json', 'w')
#file.write(JSON.generate(hash))

#file = File.read('json4.json')
#file_json = JSON.parse(file)
#p file_json
#p hash2

#file_json.merge!(hash2)
#p file_json

#json = JSON.generate(hash2)
#p json
#json = JSON.generate(file_json)

#file = File.open('json4.json', 'w')
#file.write(JSON.generate(json))

#file = File.read('json4.json')
#file_json = JSON.parse(file)
#hash = file_json
#p hash

hash = {}
hash['users'] = {}

hash['users'][1] = { name: 'Danila', age: 25}
hash['users'][2] = { name: 'Leo', age: 30}

json = JSON.generate(hash)

file = open('json4.json', 'w')
file.write(json)
file.close

file = File.read('json4.json')
parse_json = JSON.parse(file)

parse_json = JSON.generate(hash)
file = open('json4.json', 'w')
file.write(parse_json)
file.close

#add hash
file = File.read('json4.json')
parse_json = JSON.parse(file)
parse_json['users']['3'] = { name: 'Tiny', age: 35}

#add file
generate_json = JSON.generate(parse_json)
file = open('json4.json', 'w')
file.write(generate_json)
file.close

#read file
file = File.read('json4.json')
parse_json = JSON.parse(file, object_class: OpenStruct)
p parse_json
p parse_json['users']['1'].name
p parse_json['users']['1'].age
