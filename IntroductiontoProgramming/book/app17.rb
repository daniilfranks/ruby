class ObscuringReferences
	attr_reader :data

	def initialize(*data)
		@data = data
	end

	def diameters
		data.collect { |cell| cell[0] + (cell[1] * 2) }
	end

	def to_s
		"#{@data}"
	end
end

obs = ObscuringReferences.new([10,54], [23,92], [90,12])
puts obs
puts obs.diameters


class Gear
	attr_reader :chainring, :cog, :rim, :tire

	def initialize(chainring, cog, rim, tire)
		@chainring = chainring
		@cog       = cog
		@rim       = rim
		@tire      = tire
	end

	def gear_inches
		ratio * Wheel.new(rim, tire).diameter
	end

	def ratio
		chainring / cog.to_f
	end
end

class Wheel
	attr_reader :rim, :tire

	def initialize(rim, tire)
		@rim  = rim
		@tire = tire
	end

	def diameter
		rim + (tire * 2)
	end
end

puts Gear.new(52, 11, 56, 1.5).gear_inches