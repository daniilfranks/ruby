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
	extend SuperPower
end

super_ass = SuperAss.new
#p super_ass.fly
#p super_ass.leap(10)
#p super_ass.class_method

module TimeJs
	attr_reader :time_create

	def initialize
		@time_create = Time.now
	end

	def show_time
		Time.now - @time_create
	end
end

class Character
	include TimeJs

	attr_reader :name

	def initialize(name)
		@name = name
		super()
	end
end

c = Character.new('Den')
p c
p c.time_create
p c.show_time

p '*'*40

p 1.class
p 1.class.name
p 1.class.superclass

#p Object.methods
#p String.methods










