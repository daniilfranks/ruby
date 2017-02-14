Role = Struct.new(:role)

class User
	attr_reader :name, :age

	def initialize(name, age)
		@name = name
		@age  = age
		@roles = Role.new(1)
	end

	def role
		@roles.role
	end

	def to_s
		"#{@name}, #{@age}, #{@role}"
	end
end

den = User.new('Den', 25)
p den
p den.role
