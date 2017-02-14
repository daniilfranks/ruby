module Role
	def change_role(role)
		access_role
		@role = role
	end

	private

	def access_role
		raise 'Acces Error!!!' unless 1 == @role
	end
end

module Bank
	def make_withdrawal(amount)
		access_allowed
		@balance += amount
	end

	private

	def access_allowed
		raise 'Acces Error!!!' unless 'A@1p$9nZ7g(0S4s3' == @password || @role == 1
	end
end

class User
	include Role
	include Bank

	attr_reader :name, :password, :id, :balance, :role

	def initialize(name, password, id)
		@name      = name
		@password  = password
		@id        = id
		@balance   = 0
		@role      = 1
	end
end

den = User.new('Den', 'A@1p$9nZ7g(0S4s', 1)
p den

den.make_withdrawal(5000)
p den.balance
p den.change_role(10)


den = User.new('Ashot', 'A@1p$9nZ7g(0S4s', 2)
p den

den.make_withdrawal(3000)
p den.balance
p den.change_role(10)
