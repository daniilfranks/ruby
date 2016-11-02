class First
	attr_accessor :x
	attr_accessor :y

	def initialize(x=nil, y=nil)
		@x, @y = x, y
	end
end

point = Struct.new(:x, :y)
p point
p point.class
p point.name

Point = point
p Point
p point
p point.class
p point.name

Location = Point 
p Location

p Point.new
p Point.new(23)
p Point.new(5,7)
p = Point.new(4,5)
p p.x
p p.y
p p.x = 7
p p[:x]
p p[:y]
p p['x']
p p['y']
p p[:x] = 101
p Point.new(5,3) == Point.new(5,3)
p p.members
p p.max
p p.min
p p.reduce(&:+)


Second = Struct.new(:x,:y) do
	def to_s
		"(#{x}x#{y})"
	end
end

p = Second.new(5,3)
p p.to_s