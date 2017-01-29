p 1 <=> 1
p 1 <=> 2
p 2 <=> 1

p '1' === 1

p 1.class
p self.class
p self.class.superclass


class User
	attr_accessor :name, :age

	def initialize(name, age)
		@name = name
		@age  = age
	end

	def to_s
		"#{@name}, #{@age}"
	end
end

# Create object
p den = User.new('Den', 25)
p den.object_id
p den.to_s

# Clone object
p carl = den.clone
p carl.object_id
p carl.to_s

# Assigning object
p ramon = carl
p ramon.object_id
p ramon.to_s




