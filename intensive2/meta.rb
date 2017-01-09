class Array
	def fold1(method)
		inject{ |result, i| result.send(method, i) }
	end
end

puts [100.0, 200.0, 500.0].fold1('/')
puts [100.0, 200.0, 500.0].fold1('+')
puts [100.0, 200.0, 500.0].fold1('*')
puts ['h', 'i'].fold1('concat')

p (1..10).inject{ |result, i| result + i }



require 'json'
require 'ostruct'

class Test
	attr_reader :data

	def initialize(data)
		@data = data
	end

	def method_missing(sym, *args, &block)
		@data.send(sym, *args, &block)
		puts 'in method missing'
	end
end

hash = {:a=>1,:b=>[{:c=>2,:d=>[{:e=>3,:f=>4},{:e=>5,:f=>6}]},{:c=>4,:d=>[{:e=>7,:f=>8},{:e=>9,:f=>10}]},{:c=>6,:d=>[{:e=>11,:f=>12},{:e=>13,:f=>14}]}]}

json = hash.to_json

object = JSON.parse(json, object_class: OpenStruct)

test = Test.new(object)

puts '='*45
puts test.data.a
puts test.data.b
puts '='*45
puts test.a
puts test.b
puts test.aaaa
