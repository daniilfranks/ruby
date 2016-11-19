=begin 
Патерн Observer относится к семейству publish/subscribe паттернов 
программирования. Observer предоставляет механизм для уведомления 
одним объектом другого при изменении собственного состояния. 
Объект, который сообщает об изменении своего состояния называется 
уведомителем или наблюдаемым объектом, а объекты, которые уведомляются 
об изменении состояния уведомителя называются подписчиками 
или наблюдателями.
=end

require 'observer'

class Product
  include Observable
  attr_reader :price

  def initialize
    @price = 100
  end

  def set_price
    @old_price = @price
    @price = 50 + rand(50)
    unless @price == @old_price
      changed
      notify_observers(@price)
    end
  end
end

class Customer
  def initialize(name, good_price, publisher)
    @customer = name
    @good_price = good_price
    publisher.add_observer self
  end

  def update(price)
    unless price > @good_price
      puts "#{@customer} buy product for #{price.to_s}$"
    end
  end
end

product = Product.new

den = Customer.new('Den', 70, product)
leo = Customer.new('Leo', 80, product)
io  = Customer.new('Io', 90, product)

product.add_observer den
product.add_observer leo
product.add_observer io

10.times do
  product.set_price
  puts product.price
end

=begin 
#add_observer — метод добавляет подписчика

#notify_observers — метод передает вызывает метод #update объекта — наблюдателя и может передавать в него некоторые значения.

#changed — устанавливает состояние объекта в «измененное». Без вызова этого метода подписчики не получат сообщения об изменениях.

#changed? — проверяет состояние объекта-уведомителя.

#count_observers — метод возвращает количество подписчиков.

#delete_observer — метод удаляет у объекта-уведомителя переданный в качестве аргумента подписчик.

#delete_observers — удаляет все подписчики.
=end