class Song
	attr_accessor :name
	attr_accessor :duration

	def initialize name, duration
		@name = name
		@duration = duration
	end
end

song1 = Song.new 'Sia', 5
puts song1.name
puts song1.duration
puts song1.duration = 10



class Airport
	attr_reader :name
	attr_reader :planes

	def initialize(name)
		@name = name
		@planes = []
	end

	def add_plane plane
		@planes << plane
	end
end

class Plane
	attr_reader :model

	def initialize(model)
		@model = model
	end
end

airports = []

airport1 = Airport.new 'SVO'

airport2 = Airport.new 'DME'

airports << airport1
airports << airport2

plane1 = Plane.new 'Boeing-777'
plane2 = Plane.new 'A-320'
plane3 = Plane.new 'IL-76'

airport1.add_plane plane1
airport1.add_plane plane2
airport1.add_plane plane3

plane3 = Plane.new 'AA1'
plane4 = Plane.new 'BB2'
plane5 = Plane.new 'CC3'

airport2.add_plane plane3
airport2.add_plane plane4
airport2.add_plane plane5

airports.each do |airport|
	puts "Airport: #{airport.name}"

	airport.planes.each do |plane|
		puts "Plane: #{plane.model}"
	end
end