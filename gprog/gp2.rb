time = Time.new
puts time

def say_hi name
	puts "Hi, #{name}"
end

say_hi "Den"
say_hi "Jok"


class Bridge
	def initialize
		puts "Create"
		@opened = false
	end

	def open
		puts "open go"
		@opened = true
	end

	def is_opened?
		return @opened
	end
end

bridge = Bridge.new
if !bridge.is_opened?
	bridge.open
end

puts bridge.is_opened?

