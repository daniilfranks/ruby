module Hiworld
	class First
		PI = 3.14
		@@read = 0
		def say_hi
			puts "Hi First"
			read
		end

		def say_pi
			puts PI
		end

		def read
			@@read += 1
		end

		def total_read
			@@read
		end
	end

	class Two < First
		def say_two
			puts "Say two"
		end
	end
end

module BB
	def self.say_hi
		puts "Ruby!!!"
	end
end

say = Hiworld::First.new
say.say_hi

say2 = Hiworld::Two.new
say2.say_hi
say2.say_two