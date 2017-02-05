class BankAccount
	attr_reader :balance

	def initialize(balance = 0)
		@balance = balance
	end

	def deposit(param)
		@balance += param
	end

	def withdraw(param)
		@balance -= param
	end
end

class BankAccountProxy
	def initialize(real_object)
		@real_object = real_object
	end

	def balance
		@real_object.balance
	end

	def deposit(param)
		@real_object.deposit(param)
	end

	def withdraw(param)
		@real_object.withdraw(param)
	end
end

account001 = BankAccount.new(10000)
account001.deposit(999)
p account001.balance
account001.withdraw(450)
p account001.balance

bap = BankAccountProxy.new(account001)
bap.deposit(800)
p bap
p bap.balance
