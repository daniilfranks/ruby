=begin 
Стратегия (англ. Strategy) — поведенческий шаблон проектирования, 
предназначенный для определения семейства алгоритмов, 
инкапсуляции каждого из них и обеспечения их взаимозаменяемости. 
Это позволяет выбирать алгоритм путем определения соответствующего класса. 
Шаблон Strategy позволяет менять выбранный алгоритм независимо 
от объектов-клиентов, которые его используют.
=end

def net_salary(amount, country)
  taxes = case country
    when 'Russia'
      (amount * 0.05) + 313
    when 'USA'
      (amount * 0.02) + 100
    when 'Poland'
      amount * 0.03
    else
      0
    end

    amount - taxes
end

p net_salary(1000, 'Russia')
p net_salary(1000, 'Efiopia')


class RusTaxes
  def self.taxes(amount)
    (amount * 0.05) + 313
  end
end

class USATaxes
  def self.taxes(amount)
    (amount * 0.2) + 100
  end
end

class Taxes
  def initialize
    @strategies = {}
    @strategies['Russia'] = RusTaxes
    @strategies['USA']    = USATaxes
  end

  def net_salary(amount, country)
    strategy = @strategies[country]

    strategy ? amount - strategy.taxes(amount) : amount
  end
end

p Taxes.new.net_salary(1000, 'USA')
p Taxes.new.net_salary(1000, 'Belarus')