=begin 
Singleton (одиночка) — паттерн программирования позволяющий создавать такие классы, которые могут иметь только один экземпляр. Можно подумать, что это глупый паттерн, ибо если вам нужен один экземпляр (копия) класса, то вы просто создаете его и не создаете больше экземляров. Я тоже так думал и даже пытался найти обоснование тому, почему этот паттерн существует. Я понимал, что все эти паттерны были придуманы людьми куда-более умными, образованными и опытными чем я, и кажащаяся бесполезность pattern Singleton — это всего-лишь мое невегласие. Вот к чему я пришел:

Допустим у нас имеется одно приложение состоящее из нескольких модулей, например тот же фреймворк Rails, или какое-нибудь десктопное приложение. Представьте, что в контексте одного модуля вы создаете некоторый объект, который в предложении может быть только один, например объект — запрос пользователя, которых хранит различную информацию о запросе, методы ее представления и что-то еще, или это десктопное приложение и объект представляет собой обычное окно приложение и это приложение является однооконным. Теперь добавим услувие, что мы подмешивая один модуль в другой не можем получить доступ к объекту на прямую, он инициируется внутри какого-то метода, что-то там делает, но метод нам его не возвращает, в этом случае все, что мы можем сделать — это создать новый объект, а старый будет для нас утерян если мы не создали какого-нибудь специального аксессора для доступа к нему.

Честно признаться в Ruby можно хорошо обходиться без использования Singleton, однако, вам может быть полезно и интересно знать о нем, просто для общего развития или для применения в других языках программирований.

В Ruby паттерн Singleton реализован в специальной отноименной библиотеке из Ruby STDLIB. Для того, чтобы начать использовать Singleton необходимо подключить библиотеку в файл и подмешать модуль Singleton в нужный класс:

require 'singleton'

class SuperClass
  include Singleton

  def hello
    puts "Hello, I'm an instance of SuperClass and my ID is #{object_id}"
  end
end
Вот и все!

Запускаем наш любимый IRB (оболочки этого типа называются REPL, как я недавно узнал, и расшифровывается эта аббревиатура как Read Eval Print Loop — цикл чтения, выполнения и печати результата), подключаем файл с приложением и смотрим как что работает:

#$ irb
require './singleton.rb'
SuperClass.new
#NoMethodError: private method `new' called for SuperClass:Class
#    from (irb):2
#    from /home/vladimir/.rvm/rubies/ruby-1.9.2-p180/bin/irb:16:in `<main>'

first = SuperClass.instance
#<SuperClass:0x93e29a8>

second = SuperClass.instance
#<SuperClass:0x93e29a8>

first.hello
#=>Hello, I'm an instance of SuperClass and my ID is 77534420

second.hello
#=>Hello, I'm an instance of SuperClass and my ID is 77534420
Идентификаторы объектов first и second одинаковые, значит и объект один и тот же!

Давайте разберемся с тем как реализован этот паттерн, а реализован он очень просто:

1. Singleton делает метод .new приватным, т.е. доступным только в контексте класса.

2. Singleton добавляет метод instance, который является заменой методу .new, использует метод .new для создания объекта и кэширует объект.

Давайте напишем свою реализацию паттерна Singleton, которая почти ничем не будет отличаться от той, что представлена в STDLIB:

module RubyDevSingleton
  def new(*args, &block)
    @@singleton ||= super(*args, &block)
  end
end

class SuperClass
  extend RubyDevSingleton

  def initialize(message, &block)
    puts message
  end

  def id
    puts object_id
  end
end
#$ irb
require './obs.rb'

first = SuperClass.new "Hello!"
#=>Hello!

second = SuperClass.new "Hi!"
second == first #true
Мне мое решение кажется лучше стандартного потому, что объекты, что будут использовать объект класса SuperClass могут не знать о том, что в этом классе применяется паттерн Singleton и использовать как обычно метод .new для создания экземпляра класса. При желании можно легко переписать реализацию паттерна так, что метод object#initialize будет срабатывать при кажом вызове метода SuperClass.new. Авторы Singleton из STDLIB скорее всего сочли плохой идеей переписывать стандартный метод .new.
=end