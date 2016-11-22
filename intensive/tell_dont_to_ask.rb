class Wallet

  attr_accessor :balance

  def initialize(balance)
    @balance = balance
  end

  def debit(amount)
    raise 'Not enogh funds' if balance < amount
    self.balance -= amount
  end

  def credit(amount)
    self.balance += amount
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

p den = Wallet.new(5000)
p den.debit(700)
p pay = PaymentService.new(den)
p pay
p pay.debit(500)
#p pay.debit(10000)