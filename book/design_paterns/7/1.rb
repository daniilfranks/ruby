class Account
	attr_accessor :name, :balance

	def initialize(name, balance)
		@name    = name
		@balance = balance
	end
end

class Portfolio
	def initialize
		@accounts = []
	end

	def add_account(account)
		@accounts << account
	end

	def show_accounts
		@accounts.each { |i| p "#{i.name}, #{i.balance}" }
	end

	def each(&block)
		@accounts.each(&block)
	end
end

a1 = Account.new('den', 34900)
a2 = Account.new('asd', 3456)
a3 = Account.new('jok', 86784)

p1 = Portfolio.new
p1.add_account(a1)
p1.add_account(a2)
p1.add_account(a3)

p p1

p1.show_accounts

p1.each { |i| p "#{i.name}, #{i.balance}" }
