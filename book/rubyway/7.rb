class User
	attr_reader :name, :age

	def initialize(options = {})
		@name   = options[:name]   || 'Default'
		@age    = options[:age]    || 0
		@city   = options.fetch(:city, 'Kazan')
		@active = options[:active] || true
	end

	def to_s
		"#{@name}, #{@age}"
	end
end

den = User.new(name: 'Den', age: 25)
p den

default = User.new
p default


module FooFramework
	class Bar
		attr_reader :name, :age

		def initialize(name, age)
			@name = name
			@age  = age
		end

		def to_s
			"Hello #{@name}, #{@age}"
		end
	end
end

module BarWapper
	def self.bar(options = {})
		FooFramework::Bar.new(options[:name], options[:age])
	end
end

p BarWapper.bar(name: 'Den', age: 25)
