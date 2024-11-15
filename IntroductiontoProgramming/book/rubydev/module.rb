=begin
Модули являются отличным решением для группирования методов, классов и констант вместе.
Использую модули можно извлечь две значительные выгоды:

-Модули обеспечивают пространства имен и, следовательно, предотвращают возникающие с именованием методов, классов и констант ошибки.

-Модули реализуют примеси (mixins) — элегантное решение заменяющее множественное наследование.

Модули определяют пространства имен, песочницу в которой ваши методы и константы могут работать без возникновения проблем с другими методами и константами, которые имеют такие же имена.

Так выглядит модуль:

module Identifier
statement1
statement2
………..
end

<p></p>

Модульные константы именуются тем же образом, что константы в обычных классах, с первой заглавной буквой в названии. Определение методов выглядит аналогично: модульный метод объявляется так же как и метод класса.

Так же как с методами класса, мы вызываем методы модуля, но перед именами методов мы пишем имя модуля и разделитель ::, таким образом мы ссылаемся на методы класса используя конструкцию модуль::метод, где двойное двоеточие разделяет имя модуля и имя метода.

Пример:

#!/usr/bin/ruby

# Модуль определен в файле trig.rb
module Trig
  PI = 3.141592654
  def Trig.sin(x)
    # ..
  end

  def Trig.cos(x)
    # ..
  end
end
Мы можем определять несколько модулей с одинаковыми именами функций (методов), но с различной функциональностью:

#!/usr/bin/ruby
# Модуль объявлен в файле moral.rb
module Moral
  VERY_BAD = 0
  BAD = 1
  def Moral.sin(badness)
    # ...
  end
end
Мы можем определять методы модуля так же, как и методы класса, разделяя при определении методы имя метода от имени модуля точкой.

Использование метода require

В Ruby require используется так же, как и include в Си и Си++ и как import в Java. Если программа нуждается в использовании каких-либо определенных модулей, она может просто загрузить файлы с модулями используя require:

Синтаксис:

require filename

Здесь не обязательно вписывать после имени файла расширение .rb.

Пример:

require 'trig.rb'
require 'moral'

y = Trig.sin(Trig::PI/4)
wrongdoing = Moral.sin(Moral::VERY_BAD)
ВАЖНО: Здесь оба файла содержат методы с одинаковыми именами, из-за чего возникает двусмысленность кода, однако модули позволяют избежать этой двусмысленности путем указания того, какому модулю принадлежит тот или иной метод.

Использование include в Ruby

Мы можем включать в класс модули. Для включения модуля в класс используется include:

Синтаксис:

include modulename

Если модуль объявлен в отдельном файле, то он нуждается в включении этого файла используя require перед включением самого модуля в класс.

Рассмотрим следующий модуль написанный в файле Week.rb.

module Week
  FIRST_DAY = "Sunday"
  def Week.weeks_in_month
    puts "You have four weeks in a month"
  end

  def Week.weeks_in_year
    puts "You have 52 weeks in a year"
  end
end 
Теперь мы можем включить этот модуль в класс следующим образом:

#!/usr/bin/ruby
require "Week"

class Decade
  include Week
  no_of_yrs=10
  def no_of_months
    puts Week::FIRST_DAY
    number=10*12
    puts number
  end
end

d1=Decade.new
puts Week::FIRST_DAY
Week.weeks_in_month
Week.weeks_in_year
d1.no_of_months
В результате этого получим следующий результат:

Sunday
You have four weeks in a month
You have 52 weeks in a year
Sunday
120

Примеси в Ruby

Я предполагаю, что у вас есть знания ООП, которые необходимы для понимания следующей части статьи.

Если класс может наследоваться от более чем одного родительского класса, то данный класс использует множественное наследование.

Ruby не поддерживает множественного наследования, но модули в Ruby дают другую, прекрасную альтернативу множественному наследованию. Эта альтернатива позволяет использовать примеси (mixins), вместо множественного наследования.

Примеси дают нам отличный контроль над добавлением функциональности классам, однако, их истинная сила проявляется когда код в примесях начинает взаимодействовать с кодом класса, который их использует.

Давайте рассмотрим следующий пример кода для понимания примесей:

module A
  def a1
  end
  def a2
  end
end

module B
  def b1
  end
  def b2
  end
end

class Sample
  include A
  include B

  def s1
  end
end

samp=Sample.new
samp.a1
samp.a2
samp.b1
samp.b2
samp.s1
Модуль А состоит из методов а1 и а2. Модуль В состоит из методов b1 и b2. Класс Sample включает в себя оба модуля A и B. Класс Sample может получать доступ ко всем четырем методам с именами a1, a2, b1 и b2. Поэтому, мы можем видеть что класс Sample наследуется от обоих модулей. Таким образом мы можем сказать, что класс Sample наследуется от нескольких модулей, при том, что для Ruby множественное наследование чуждо. Это сделано с целью избежать проблем возникающих при использовании множественного наследования в других языках программирования.
=end