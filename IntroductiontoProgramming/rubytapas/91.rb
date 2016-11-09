class BankAccount
	attr_reader :balance_cents

	def initialize(starting_balance_cents=0)
		@balance_cents = starting_balance_cents
	end
end

module TransferSourceAccount
	def transfer_to(recipint, amount_cents)
		if @balance_cents < amount_cents
			raise "Insufficint funds"
		else
			@balance_cents -= amount_cents
			recipint.receive(amount_cents)
		end
	end
end

module TransferDestinationAccount
	def receive(amount_cents)
		@balance_cents += amount_cents
	end
end

source_account = BankAccount.new(100_00)
dest_account   = BankAccount.new(0)
source_account.extend(TransferSourceAccount)
dest_account.extend(TransferDestinationAccount)

source_account.transfer_to(dest_account, 50_00)
p source_account.balance_cents
p dest_account.balance_cents