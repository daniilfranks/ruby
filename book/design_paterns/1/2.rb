class Vehicle
	def start_engine
		p "start class: #{self.class.name}"
	end

	def stop_engine
		p "stop class: #{self.class.name}"
	end
end

class Car < Vehicle
	def sunday_drive
		start_engine
		stop_engine
	end
end

class Engine

end

v = Vehicle.new
v.start_engine
v.stop_engine

p '*'*40

c = Car.new
c.start_engine
c.stop_engine
c.sunday_drive
