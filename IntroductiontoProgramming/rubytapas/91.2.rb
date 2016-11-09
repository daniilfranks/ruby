module DomainObject
	attr_accessor :role

	def method_missing(method_name, *args, &block)
		if role && role.public_method_defined?(method_name)
			role.instance_method(method_name).bind(self).call(*args, &block)
		else
			super
		end
	end

	def response_to_missing(method_name, include_all=false)
		if role && role.public_method_defined?(method_name)
			true
		else
			super
		end
	end

	def play_role(role)
		self.role = role
		yield
	ensure
		self.role = nil
	end
end

class BankAccount
	include DomainObject
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

source_account.play_role(TransferSourceAccount) do 
	dest_account.play_role(TransferDestinationAccount) do
		source_account.transfer_to(dest_account, 25_00)
	end
end

p source_account.balance_cents
p dest_account.balance_cents
p source_account.respond_to?(:transfer_to)
p dest_account.respond_to?(:receive)