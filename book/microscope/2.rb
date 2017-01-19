module Name
	def first_name
		"You first_name #{super}"
	end

	def last_name
		"You last_name #{super}"
	end
end

module Role
	BASE_ROLE = 0
	def role
		"You role #{super}"
	end
end

class User
	include Name
	include Role

	attr_accessor :first_name, :last_name, :role

	def initialize(first_name, last_name, role)
		@first_name = first_name
		@last_name  = last_name
		@role       = role
	end

	def to_s
		"#{@first_name}, #{@last_name}, #{@role}, #{BASE_ROLE}"
	end
end

den = User.new('Den', 'Babanov', 1)
p den
p den.first_name
p den.last_name
p den.role
p den.to_s

# p den.methods.sort
