begin
  File.open('user.txt', 'r') do |f|
    while line = f.gets
      puts line
    end
  end
rescue Exception => e
  puts 'Error'
  puts e.message
  puts e.backtrace.inspect
end

Player = Struct.new(:name, :age)

den = Player.new('Den', 25)
p den
p den.name
p den.age = 26
p den

leo = Player.new('Leo', 30)
p leo


require 'ostruct'
require 'json'
require 'pp'

player = {
          1 => { name: 'Den', age: 25 },
          2 => { name: 'Leo', age: 30 },
          'ash' => { name: 'Ash', age: 20, city: {name1: 'Kazan', name2: 'London',} }
          }

pp player
pp player[1]
pp player[1][:name]
pp player[1][:age]
pp player[2]

json = player.to_json
object = JSON.parse(json, object_class: OpenStruct)
pp object

pp object['1'].name
pp object['ash']
pp object['ash'].city
pp object['ash'].city.name1
pp object['ash'].city.name2
pp object['ash'].city.name3

pp '*'*45

object.to_h.each do |i|
  puts i
end

object.to_h.each do |object|
  object[1].to_h.each do |value|
    puts value[1]
  end
end

p object.to_h
