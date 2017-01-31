class Engine
	def start_engine
		p "start class: #{self.class.name}"
	end

	def stop_engine
		p "stop class: #{self.class.name}"
	end
end

class Car
	def initialize
		@engine = Engine.new
	end

	def sunday_drive
		p @engine.start_engine
		@engine.stop_engine
	end
end

c = Car.new
p c
p c.sunday_drive
