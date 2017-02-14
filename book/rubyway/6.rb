class Role
	def initialize(role)
		@role = role
	end
end

class User
	attr_reader :name, :age, :role

	def initialize(name, age)
		@name = name
		@age  = age
		@role = Role.new(1)
	end

	def to_s
		"#{@name}, #{@age}, #{@role}"
	end
end

den = User.new('Den', 25)
p den
p den.role
