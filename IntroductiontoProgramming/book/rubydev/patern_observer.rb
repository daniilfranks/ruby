=begin 
Патерн Observer относится к семейству publish/subscribe паттернов программирования. Observer предоставляет механизм для уведомления одним объектом другого при изменении собственного состояния. Объект, который сообщает об изменении своего состояния называется уведомителем или наблюдаемым объектом, а объекты, которые уведомляются об изменении состояния уведомителя называются подписчиками или наблюдателями.

В стандартной библиотеке Ruby имеется отличная реализация данного паттерна — библиотека Observer.

Давайте напишем простой код, в котором покажем как можно использовать паттерн Observer.

Допустим у нас имеется объект — product со свойством price и несколько объектов customer’ов. Задача заключается в том, чтобы все объекты типа Customer следили за ценой и в зависимости от изменения цены покупали товар.

require 'observer'

class Product
  include Observable

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
  def initialize(name, good_price)
    @customer   = name
    @good_price = good_price
  end
  def update(price)
    unless price > @good_price
      puts @customer + " buy product for " + price.to_s + " dollars."
    end
  end
end

product = Product.new

ivan  = Customer.new("Ivan", 70)
vasya = Customer.new("Vasya", 80)
vova  = Customer.new("Vova", 90)

product.add_observer ivan
product.add_observer vasya
product.add_observer vova

10.times do
  product.set_price
  puts product.price
end
В класс Product подмешиваются методы из модуля Observable. Сперва мы рассмотрим те, что встречались нам в коде:

#add_observer — метод добавляет подписчика

#notify_observers — метод передает вызывает метод #update объекта — наблюдателя и может передавать в него некоторые значения.

#changed — устанавливает состояние объекта в «измененное». Без вызова этого метода подписчики не получат сообщения об изменениях.

#changed? — проверяет состояние объекта-уведомителя.

#count_observers — метод возвращает количество подписчиков.

#delete_observer — метод удаляет у объекта-уведомителя переданный в качестве аргумента подписчик.

#delete_observers — удаляет все подписчики.

Для класса подписчиков можно сделать небольшой рефакторинг:

class Customer
  def initialize(name, good_price, publisher)
    @customer   = name
    @good_price = good_price
    publisher.add_observer self
  end
  def update(price)
    unless price > @good_price
      puts @customer + " buy product for " + price.to_s + " dollars."
    end
  end
end

product = Product.new

ivan  = Customer.new("Ivan", 70, product)
vasya = Customer.new("Vasya", 80, product)
vova  = Customer.new("Vova", 90, product)
=end