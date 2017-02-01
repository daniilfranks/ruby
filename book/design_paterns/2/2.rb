require_relative '1'

class InterestBearingAccount < BankAccount
	def initialize(account_owner, rate)
		super(account_owner)
		@rate = rate
	end

	def deposit_interest
		@balance += @rate * @balance
	end
end
