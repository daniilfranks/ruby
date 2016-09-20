class Car
	def initialize(engine)
		@engine = engine
	end

	def rev_engine
		@engine.make_sound
	end
end

class Enqine
	def initialize(sound="Vroom!!!")
		@sound = sound
	end	

	def make_sound
		puts @sound
	end
end

engine = Enqine.new
car = Car.new(engine)
car.rev_engine


class Boat
	def initialize(name)
		@name = name
	end
end

class PowerBoat < Boat 
	def initialize(name, motor_type)
		super(name)
		@motor_type = motor_type
	end	

	def info
		puts "Name: #{@name}"
		puts "Moto type: #{@motor_type}"
	end
end

boat = PowerBoat.new("Guppy","outboard")
boat.info