class Gear
	attr_reader :cha, :cog, :wheel

	def initialize(cha, cog, wheel = nil)
		@cha   = cha
		@cog   = cog
		@wheel = wheel
	end

	def ratio
		@cha / @cog
	end

	def gear_inches
		ratio * @wheel.diameter
	end

	def circ
		@cha * @wheel.rim
	end

	def to_s
		"#{@wheel.rim}, #{@wheel.tire}"
	end

	def show_number
		@cha * Whell.new(10, 30).diameter
	end
end

class Whell
	attr_reader :rim, :tire

	def initialize(rim, tire)
		@rim  = rim
		@tire = tire
	end

	def diameter
		@rim + (@tire * 2)
	end
end

wheel = Whell.new(26, 1.5)
p wheel.diameter

gear = Gear.new(52, 11, wheel)
p gear
p gear.gear_inches
p gear.ratio
p gear.circ
p gear.to_s

p gear.show_number
