class TestMethodMissing
	def hello
		puts 'Hello method missing'
	end

	def method_missing(name, *args)
		puts "Warning: #{name}"
		puts "Arguments: #{args.join(' ')}"
	end
end

tmm = TestMethodMissing.new
tmm.hello
tmm.send(:hello)

tmm.run
tmm.add('car', 'cat')


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

class AccountProxy
  def initialize(real_account)
    @subject = real_account
  end

  def method_missing(name, *args)
    puts "Drats! There is no #{name} method."
  end
end

ap = AccountProxy.new(BankAccount.new(100))
ap.deposit(25)