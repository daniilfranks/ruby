class BankAccount
	attr_reader :account_owner

	def initialize(account_owner)
		@account_owner = account_owner
		@balance       = 0
	end

	def deposite(amount)
		@balance += amount
	end

	def withdraw(amount)
		@balance -= amount
	end

	def set_balance(amount)
		@balance = amount
	end

	def about_account
		"Account: #{@account_owner}, Balance #{@balance}"
	end
end
