def name
	puts 'Ruby'
end

send :name


def mm hash
	puts hash.inspect
end


send :mm, :aa => "111", :bb => "222"


class Something
	attr_accessor :x, :y

	def initialize hash
		hash.each do |key,value|
			send "#{key}=", value
		end
	end
end

s = Something.new :x => 1, :y => 2
puts s.x


class Kazan
	def initialize action
		@action = action
	end

	def method_missing name
		value = @action[name]
		puts "#{name}, #{value}"
	end
end

k = Kazan.new :cook => "Bob", :take_a_ride => "Spensor"
k.cook
k.take_a_ride
k.nohash