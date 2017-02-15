require 'forwardable'

User = Struct.new(:first_name, :last_name, :city)

class ForwardableUser
	extend Forwardable

	def_delegators :@user, :first_name, :last_name, :city

	def initialize(user)
		@user = user
	end

	def full_name
		"#{first_name} #{last_name}"
	end

	def greeting
		"Hi #{full_name}, I live in #{city}"
	end
end

den = User.new('Danila', 'Babanov', 'Kazan')
p den

forwardable_user = ForwardableUser.new(den)
p forwardable_user.full_name
p forwardable_user.first_name
p forwardable_user.last_name
p forwardable_user.greeting


require 'delegate'

class DelegateUser < SimpleDelegator
	def full_name
		"#{first_name} #{last_name}"
	end

	def greeting
		"Hi #{full_name}, I live in #{city}"
	end
end

leo = User.new('Leo', 'Zilik', 'London')
delegate_user = DelegateUser.new(leo)
p delegate_user.full_name
p delegate_user.first_name
p delegate_user.last_name
p delegate_user.greeting
