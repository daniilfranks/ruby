values = [true, false, nil, 0, 1, "false", "", 3.14159]

values.each do |value|
	if value
		puts "#{value.inspect} is truthy"
	else
		puts "#{value.inspect} is false"
	end
end

require 'json'

CoffeeOrder = Struct.new(:creamer, :sugar) do 
	def creamer?
		creamer
	end

	def to_json
		{
			:add_creamer  => creamer?,
			:creamer_type => creamer?
		}.to_json
	end
end

p black_coffee = CoffeeOrder.new(nil)
p black_coffee.creamer?
p black_coffee.to_json

p skim_coffe = CoffeeOrder.new(:skim)
p skim_coffe.creamer?
p skim_coffe.to_json

p ! :skim
p ! nil
p !! :skim
p !! nil