class Taxes

  attr_reader :amount

  def initialize(amount)
    @amount = amount

    @strategies = {}
    @strategies['Russia'] = -> { (amount * 0.05) + 313 }
    @strategies['USA']    = -> { (amount * 0.3) + 100 }
  end

  def net_salary(country)
    strategy = @strategies[country]
    strategy ? amount - strategy.call : amount
  end
end

p Taxes.new(1200).net_salary('USA')
p Taxes.new(1200).net_salary('Spain')
p Taxes.new(1000)