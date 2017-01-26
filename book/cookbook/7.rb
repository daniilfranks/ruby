p Class
p Class.superclass

module SuperPower
	def self.included(receiver)
		receiver.extend(ClassMethods)
	end

	def fly
		'Flying'
	end

	def leap(param)
		"Leap: #{param}"
	end

	module ClassMethods
		def class_method
			puts "SuperPower::ClassMethods"
		end
	end
end

class SuperAss
	include SuperPower
end

super_ass = SuperAss.new
#p super_ass.fly
#p super_ass.leap(10)
#p super_ass.class_method

