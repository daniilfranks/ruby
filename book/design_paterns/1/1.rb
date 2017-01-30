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
