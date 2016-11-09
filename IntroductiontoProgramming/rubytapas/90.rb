class C
	def self.foo
		puts "Who needs instances, I'm a class method!"
	end

	def C.bar
		puts "I'm a class method too!"
	end

	class << self
		def baz
			puts "Just another class method!"
		end
	end

	puts "Hello from #{self}"
end

C.foo
C.bar
C.baz

s = "Den"

def s.greet
	puts "Hi, I,m #{self}"
end

s.greet