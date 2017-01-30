class Car
	def initialize
		puts "new car #{self}"
	end

	def drive(distance = 0)
		puts "drive car #{self}: #{distance}"
	end
end

bmw = Car.new
bmw.drive(100)

class AirPlane
	def initialize
		puts "new plane #{self}"
	end

	def travel(distance = 0)
		puts "fly plane #{self}: #{distance}"
	end
end

airbus = AirPlane.new
airbus.travel(900)

p '*'*40

def get_vehicle
	if rand(100) > 50
		AirPlane.new
	else
		Car.new
	end
end

p get_vehicle

p '*'*40

car       = 0
air_plane = 0
i         = 0

while i < 100
	i += 1
	if rand(100) >= 50
		air_plane += 1
		AirPlane.new
	else
		car += 1
		Car.new
	end
end

p car
p air_plane

p car > air_plane ? 'Win Car!!!' : 'Win AirPlane!!!'
