require 'json'
require 'pp'
require 'ostruct'

sample = File.read('sample.json')

data = JSON.parse(sample,object_class: OpenStruct)

fathers = data.fathers
# pp fathers
# pp fathers[0]
# pp fathers[0].id
# pp fathers[0].name
# pp fathers[0].married
# pp fathers[0].sons
# pp fathers[0].daughters
# pp fathers[0].daughters[0].age
# pp fathers[0].daughters[0].name


data = File.readlines('names.txt')

hash = Hash.new

data.each do |i|
		user = i.split(',')
		# "#{b[0].delete('(')} #{b[1]} #{b[2]} #{b[3]} #{b[4]} #{b[5].delete(')')}"

		id         = user[0].delete('(')
		date1      = user[1].delete('\'')
		name       = user[2].delete('\'')
		first_name = user[3].delete('\'')
		last_name  = user[4].delete('\'')
		date2      = user[5].delete(') \'')
		# puts "#{id} #{date1} #{name} #{first_name} #{last_name} #{date2}"

		hash.merge!( id => {
												id:         id,
												date1:      date1,
												name:       name,
												first_name: first_name,
												last_name:  last_name,
												date2:      date2
												}
								)
end

# pp hash
# pp hash['110567']
# pp hash['110567'][:id]
# pp hash['110567'][:name]

file = File.open('names.json', 'w')
file.write(JSON.generate(hash))
