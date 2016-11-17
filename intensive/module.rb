=begin
Модули являются отличным решением для группирования методов, 
классов и констант вместе.
Использую модули можно извлечь две значительные выгоды:

-Модули обеспечивают пространства имен и, следовательно,
предотвращают возникающие с именованием методов, классов и констант ошибки.

-Модули реализуют примеси (mixins) — элегантное решение заменяющее 
множественное наследование.

Модули определяют пространства имен, песочницу в которой ваши методы 
и константы могут работать без возникновения проблем с другими методами 
и константами, которые имеют такие же имена.

Модульные константы именуются тем же образом, что константы в обычных 
классах, с первой заглавной буквой в названии. Определение методов 
выглядит аналогично: модульный метод объявляется так же как и метод класса.

Так же как с методами класса, мы вызываем методы модуля, но перед именами 
методов мы пишем имя модуля и разделитель ::, таким образом мы ссылаемся 
на методы класса используя конструкцию модуль::метод, где двойное 
двоеточие разделяет имя модуля и имя метода.
=end

module Trig
  PI = 3.141592654

  def Trig.sin(x)

  end

  def Trig.cos(x)

  end
end

module Moral
  VERY_BAD = 0
  BAD = 1

  def Moral.sin(badness)

  end
end

y = Trig.sin(Trig::PI/4)
wrongdoing = Moral.sin(Moral::VERY_BAD)


module Week
  FIRST_DAY = 'Sunday'
  def Week.weeks_in_month
    puts 'You have four weeks in a month'
  end

  def Week.weeks_in_year
    puts 'You have 52 week in a year'
  end
end

class Decade
  include Week
  no_of_yrs = 10

  def no_of_months
    puts Week::FIRST_DAY
    number = 10 * 12
    puts number
  end
end

d1 = Decade.new
puts Week::FIRST_DAY
Week.weeks_in_month
Week.weeks_in_year
d1.no_of_months


module A
  def a1; end
  def a2; end
end

module B
  def b1; end
  def b2; end
end

class Sample
  include A
  include B

  def s1; end
  def s2; end
end

sample = Sample.new
sample.a1
sample.a2
sample.b1
sample.b2
sample.s1
sample.s2