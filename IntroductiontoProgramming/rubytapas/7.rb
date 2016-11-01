=begin
class Point
	def initialize(x,y)
		@x, @y = x, y
	end
end

class Point
	def self.my_new(*args, &block)
		instance = allocate
		instance.my_initialize(*args, &block)
		instance
	end

	def my_initialize(x,y)
		@x = x
		@y = y
	end
end

p Point.my_new(3,5)

class Point
	def self.new_cartesian(x, y)
		instance = allocate
		instance.initialize_cartesian(x, y)
		instance
	end

	def self.new_polar(distance, angle)
		instance = allocate
		instance.initialize_cartesian(polar_to_cartesian(distance, angle))
		instance
	end
end

=end

class Snowflake
	class << self
		private :new
	end

	def self.instance
		@instance ||= new 
	end
end

p Snowflake.instance


require 'singleton'

class TheOne
	include Singleton
end

p TheOne.instance


class RpsMove
	def self.new(move)
		@cache ||= {}
		@cahe[move] ||= super(move)
	end

	def initialize(move)
		@move = move
	end
end

p RpsMove.new(:rock)