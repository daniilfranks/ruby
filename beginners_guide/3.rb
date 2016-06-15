class BankAccount
	attr_reader :name
	attr_accessor :balance

	def initialize name
		@balance = 0
		@name = name
	end

	class << self
		def create_for name
			@accounts ||= []
			@accounts << BankAccount.new(name)
		end

		def find_for name
			@accounts.find {|account| account.name == name}
		end
	end

	def deposit amount
		@balance += amount
	end

	def withdraw amount
		@balance -= amount
	end

	def call_the_rest_method
		rest!
	end

	private
	def rest!
		@balance = 0
	end
end

#irb
#load './3.rb'
#bank_account = BankAccount.new "Den"
#bank_account.deposit 100
#bank_account.inspect
#bank_account.withdraw 50
#bank_account.inspect

#irb
#load './3.rb'
#BankAccount.create_for "Den"
#BankAccount.create_for "Oleg"
#den_account = BankAccount.find_for "Den"
#den_account.balance
#den_account.deposit 150
#den_account.withdraw 23
#den_account.call_the_rest_method