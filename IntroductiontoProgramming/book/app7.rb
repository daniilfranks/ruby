require 'forwardable'

class User
	extend Forwardable

	def_delegators :@account, :first_name, :last_name, :email_address

	def initialize(account)
		@account = account
	end

	def full_name
		"#{first_name} #{last_name}"
	end
end

class Store
	extend Forwardable

	def_delegator '@owner', :email_address, :owner_email

	def initialize(owner)
		@owner = owner
	end
end

GithubAccount = Struct.new(:login, :email_address, :first_name, :last_name)
FacebookAccount = Struct.new(:uid, :email_address, :first_name, :last_name)

den = User.new(GithubAccount.new("denden","den@test.com","Den","Bob"))
puts den.full_name
store = Store.new(den)
store.owner_email