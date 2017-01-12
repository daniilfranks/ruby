require 'json'

p Dir.exists?('/json')
p Dir.exists?('/home/boban/ruby/intensive2/json')
p Dir.pwd

p Dir.glob('*')
p Dir.glob('*.rb')
p Dir.glob('*.json')

file = File.join("**", "*.json")
p Dir.glob(file)

files = File.join("**", "json", "**", "*.json")
p Dir.glob(files)

#add json
files = File.join("**", "json", "**", "json1.json")
file = Dir.glob(files)

hash = { name: 'Den', age: 25 }

file = File.open(file[0], 'w')
file.write(JSON.generate(hash))
file.close

#add file user
username = 'danila'
filename = "#{username}.json"
file = "#{username}/#{filename}"

unless Dir.exists?(username)
	Dir.mkdir(username)
end

hash = { name: 'Danila', age: 25 }

file = File.open(file, 'w')
file.write(JSON.generate(hash))
file.close

#readfile
files = File.join("**", username, "**", filename)
file = Dir.glob(files)

file = File.read(file[0])
file_json = JSON.parse(file)
p file_json

#empty file ?
files = File.join("**", username, "**", "json1.json")
file = Dir.glob(files)
p file.empty?
