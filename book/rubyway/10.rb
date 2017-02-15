class User
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def to_s
		"Hello: #{name}"
	end
end

asd = User.new('Asd')
puts asd

module RefinedUser
	refine User do

		def to_s
			"User name is #{name}"
		end
	end
end

class UserDecarator
	using RefinedUser

	def self.decorated_user
		puts User.new('Jok').to_s
	end
end

UserDecarator.decorated_user
