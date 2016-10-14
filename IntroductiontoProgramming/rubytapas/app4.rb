SleepTimer = Struct.new(:minutes, :notifier, :notifier_message) do 
	def start
		sleep minutes * 60
		notifier.public_send(notifier_message, "Tea is ready!")
	end
end

timer = SleepTimer.new(0.01, $stdout, :puts)
puts timer.start


=begin
class Point
	attr_accessor :x
	attr_accessor :y

	def intialize(x=nil, y=nil)
		@x = x
		@y = y
	end
end

point = Point.new
p point
p point.x = 1
p point.x = 2
p point.class
#p point.methods
=end

point = Struct.new(:x, :y)
p point
p point.class
p point.name
Point = point
p Point
p Point.class
p Point.new
p Point.new(23)
p Point.new(5,7)
p = Point.new(4,5)
p p.x
p p.y
p p.y = 99



User = Struct.new(:x, :y) do
	def to_s
		"#{x}x#{y}"
	end
end

p User.new(5,3)
p.to_s