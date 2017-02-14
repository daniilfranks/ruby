class User
	attr_reader :name, :age

	def initialize(options = {})
		@name   = options[:name]   || 'Default'
		@age    = options[:age]    || 0
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
