class Gear
	attr_reader :chairing, :cog

	def initialize(chairing, cog)
		@chairing = chairing
		@cog      = cog
	end

	def ratio
		chairing / cog.to_f
	end
end

puts Gear.new(52, 11).ratio
puts Gear.new(30, 17).ratio
