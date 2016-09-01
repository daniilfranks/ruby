class Airplane
	attr_reader :model
	attr_reader :altitude
	attr_reader :speed

	def initialize(model)
		@model = model
		@speed = 0
		@altitude = 0
	end

	def fly
		@speed = 800
		@altitude = 10000
	end

	def land
		@speed = 0
		@altitude = 0
	end

	def moving?
		@speed > 0
	end
end

plane1 = Airplane.new('Boeing-777')
puts "#{plane1.model} #{plane1.speed} #{plane1.altitude}"
puts "#{plane1.moving?}"

plane1.fly
puts "#{plane1.model} #{plane1.speed} #{plane1.altitude}"
puts "#{plane1.moving?}"

plane1.land
puts "#{plane1.model} #{plane1.speed} #{plane1.altitude}"
puts "#{plane1.moving?}"

models = ['Airbus-320', 'Boeing-777', 'IL-86']
planes = []

100.times do 
	model = models[rand(0..2)]
	plane = Airplane.new(model)

	if rand(0..1) == 1
		plane.fly
	end

	planes << plane
end

planes.each do |plane|
	puts "#{plane.model} #{plane.speed} #{plane.altitude}"
	puts "#{plane.moving?}"
end