class BankAccount
	attr_reader :balance_cents

	def initialize(starting_balance_cents=0)
		@balance_cents = starting_balance_cents
	end
end

require 'delegate'

class TransferSourceAccount < SimpleDelegator
	def transfer_to(recipint, amount_cents)
		if @balance_cents < amount_cents
			raise "Insufficint funds"
		else
			@balance_cents -= amount_cents
			recipint.receive(amount_cents)
		end
	end
end

class TransferDestinationAccount < SimpleDelegator
	def receive(amount_cents)
		@balance_cents += amount_cents
	end
end

source_account = BankAccount.new(100_00)
dest_account   = BankAccount.new(0)
xfer_source_account = TransferSourceAccount.new(source_account)
xfer_dest_account = TransferDestinationAccount.new(dest_account)

p source_account.class
p xfer_source_account
p dest_account.balance_cents