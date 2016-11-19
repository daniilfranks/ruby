=begin 
Наблюдатель. Определяет зависимость типа «один ко многим» между объектами 
таким образом, что при изменении состояния одного объекта все зависящие 
от него оповещаются об этом событии.

У нас есть класс Ticker, который будет менять цену и оповещать об изменении 
наблюдателей WarnLow и WarnHigh, которые будут выводить соответствующие 
сообщения в случае с выходом цена за заданные пределы.
=end

require 'observer'

class Ticker
  include Observable

  def initialize(symbol)
    @symbol = symbol
  end

  def run
    last_price = nil
    10.times do 
      price = Price.fetch(@symbol)
      print "Current price: #{price}\n"
      if price != last_price
        changed
        last_price = price
        notify_observers(Time.now, price)
      end
      sleep 1
    end
  end
end

class Price
  def Price.fetch(symbol)
    60 + rand(80)
  end
end

class Warner
  def initialize(ticker, limit)
    @limit = limit
    ticker.add_observer(self)
  end

  def update(time, price)
    raise 'Method "update" must be implemented!'
  end  
end

class WarnLow < Warner
  def update(time, price)
    if price < @limit
      print "---#{time.to_s}: Price below #{@limit}: #{price}\n"
    end
  end
end

class WarnHigh < Warner
  def update(time, price)
    if price > @limit
      print "+++#{time.to_s}: Price above #{@limit}: #{price}\n"
    end
  end
end

ticker = Ticker.new('MSFT')
WarnLow.new(ticker, 80)
WarnHigh.new(ticker, 120)
ticker.run