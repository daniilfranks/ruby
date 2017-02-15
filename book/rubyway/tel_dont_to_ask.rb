class Wallet
	attr_accessor :balance

	def initialize(balance)
		@balance = balance
	end

	def debit(amount)
		raise 'Not enogh funds' if balance < amount
		@balance -= amount
	end

	def credit(amount)
		@balance += amount
	end
end

class PaymentService
	attr_reader :wallet

	def initialize(wallet)
		@wallet = wallet
	end

	def debit(amount)
		wallet.debit(amount)
	end

	def credit(amount)
		wallet.credit(amount)
	end
end

class Cart
	attr_reader :wallet

	def initialize(wallet)
		@wallet = wallet
	end

	def debit(amount)
		wallet.debit(amount)
	end
end

wallet_den = Wallet.new(10000)
payment_den = PaymentService.new(wallet_den)

p wallet_den
p payment_den

payment_den.debit(3000)

p wallet_den
p payment_den

payment_den.credit(2000)

p wallet_den.balance

cart = Cart.new(wallet_den)
p cart
cart.debit(5000)

p wallet_den.balance
