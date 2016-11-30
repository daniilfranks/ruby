class BankAccount
  attr_reader :number, :balance_cents

  def initialize(number)
    @number        = number
    @balance_cents = 0
  end

  def deposit(amount)
    @balance_cents += amount
  end

  def withdraw(amount)
    @balance_cents -= amount
  end

  def inspect
    "{#<%s %s ($%0.2f)>}" %
    [self.class, @number, @balance_cents / 100.0]
  end
  alias_method :to_s, :inspect
end

class AuditLog
  def record(number, action, amount, balance)
    printf(
      "%<time>s #%<number>s %<action>s %<amount>.2f (%<balance>.2f)\n",
      time:    Time.now,
      number:  number,
      action:  action,
      amount:  amount / 100,
      balance: balance / 100
    )
  end
end

require 'delegate'

class AuditAccount < SimpleDelegator
  def initialize(account, audit_log)
    super(account)
    @audit_log = audit_log
  end

  def deposit(amount)
    super
    @audit_log.record(number, :deposit, amount, balance_cents)
  end

  def withdraw(amount)
    super
    @audit_log.record(number, :withdrawl, amount, balance_cents)
  end
end

class Customer
  def notify(message)
    #...
  end
end

def withdraw_and_notify(customer, account, amount)
  account.withdraw(amount)
  new_balance = account.balance_cents
  customer.notify("Your new balance iss %.2f" [new_balance / 100.0])
end

account  = BankAccount.new(123)
account  = AuditAccount.new(account, AuditLog.new)
customer = Customer.new

account.deposit(1000)
withdraw_and_notify(customer, account, 300)