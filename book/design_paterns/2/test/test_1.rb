require 'minitest/autorun'
require_relative '../1'

class TestCar < Minitest::Test
	def setup
		@bank = BankAccount.new('account001')
		@bank.instance_variable_set(:@balance, 500)
	end

	def test_account_owner
		assert_equal('account001', @bank.account_owner)
	end

	def test_balance
		assert_equal(500, @bank.instance_variable_get(:@balance))
	end

	def test_deposite
		assert_equal(700, @bank.deposite(200))
	end

	def test_withdraw
		assert_equal(300, @bank.withdraw(200))
	end

	def test_set_balance
		assert_equal(2000 , @bank.set_balance(2000))
	end

	def test_about_account
		assert_equal("Account: account001, Balance 500", @bank.about_account)
	end
end
