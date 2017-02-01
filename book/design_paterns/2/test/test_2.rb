require 'minitest/autorun'
require_relative '../2'

class TestInterestBearingAccount < Minitest::Test
	def setup
		@iba = InterestBearingAccount.new('account001', 0.1)
		@iba.instance_variable_set(:@balance, 500)
	end

	def test_account_owner
		assert_equal('account001', @iba.account_owner)
	end

	def test_balance
		assert_equal(500, @iba.instance_variable_get(:@balance))
	end

	def test_deposite
		assert_equal(700, @iba.deposite(200))
	end

	def test_withdraw
		assert_equal(300, @iba.withdraw(200))
	end

	def test_set_balance
		assert_equal(2000, @iba.set_balance(2000))
	end

	def test_about_account
		assert_equal("Account: account001, Balance 500", @iba.about_account)
	end

	def test_deposit_interest
		assert_equal(550, @iba.deposit_interest)
	end
end
