=begin
Исключительные ситуации (exceptions) — это ошибки возникшие в вашем коде и которые также представлены в виде специальных объектов. Лично у меня самой популярной ошибкой, благодаря тому, что яне владею слепым набором, является NoMethodError или NameError:

Array.hello
#NoMethodError: undefined method `hello' for Array:Class
#from (irb):3
#from /home/vladimir/.rvm/rubies/ruby-1.9.2-p0/bin/irb:17:in `<main>'

hello
#NameError: undefined local variable or method `hello' for main:Object
#from (irb):4
#from /home/vladimir/.rvm/rubies/ruby-1.9.2-p0/bin/irb:17:in `<main>'
Ниже приведен иерархический список всех стандартных исключительных ситуаций в Ruby:


Exception
 NoMemoryError
 ScriptError
   LoadError
   NotImplementedError
   SyntaxError
 SignalException
   Interrupt
 StandardError
   ArgumentError
   IOError
     EOFError
   IndexError
   LocalJumpError
   NameError
     NoMethodError
   RangeError
     FloatDomainError
   RegexpError
   RuntimeError
   SecurityError
   SystemCallError
   SystemStackError
   ThreadError
   TypeError
   ZeroDivisionError
 SystemExit
 fatal
Вам не обязательно создавать в вашем коде ошибку, вы можете принудительно вызвать исключительную ситуацию при помощи метода raise:

def my_method()
  raise "SomeError message ..."
end

my_method
#exceptions.rb:2:in `my_method': SomeError message ... (RuntimeError)
#from exceptions.rb:5:in `<main>'
Давайте разберем сообщение об ошибке. Оно содержит весьма полезную информацию, которая необходима вам для исправления ошибки: где находится ошибка (exceptions.rb:2:in `my_method’), сообщение описывающее ошибку (SomeError message …), тип ошибки (RuntimeError), и место где возникла ошибка (#from exceptions.rb:5:in `<main>’).

Обработка ошибок
Реальная польза от всех этих типов ошибок заключается в возможности их обработки. Обработка ошибок — это код, который выполняется только при условии возникновения ошибок. Код, ошибки в котором следует обрабатывать необходимо заключить в блок begin — end, а отлавливание ошибок следует производить при помощи ключевого слова rescue. Пример:

begin
  100 / 0
rescue
  puts "Fuck! Divider is zero!"
end
#=> Fuck! Divider is zero!
Код после rescue выполнится только после возникновения исключительной ситуации, любой исключительной ситуации! rescue может принимать параметр — тип исключительной ситуации для того, чтобы обрабатывать лишь один определенный тип ошибок, таким образом можно выполнять различный код для различных ошибок. Пример:

begin
  some_undefined_method_call
rescue NameError
  puts "Fuck! Undefined method!"
end
#=>Fuck! Undefined method!
Иногда бывает необходимость выполнить кусок кода независимо от того была ошибка или небыло. Для этого существует ensure. Пример:

begin
  some_undefined_method_call
rescue NameError
  p "Fuck! Undefined method!"
ensure
  p "RubyDev.ru"
end
#=>"Fuck! Undefined method!"
#=>"RubyDev.ru"
Выможете использовать обработчик ошибок rescue и ensure не только в контексте begin — end, но и в контексте любого блока кода, например в контексте метода или класса. Пример:

def hello(msg = "")
  raise "Empty message!" if msg == ""
  puts(msg)
rescue
  puts "Some Error!"
end

hello("Rubydev.ru") #Rubydev.ru
hello #Some Error!
«Кошэрная» обработка ошибок

Чтобы в обработчике ошибок иметь доступ к различной информации об ошибке, необходимо использовать следующий синтаксис:

def hello(msg = "")
  raise "Empty message!" if msg == ""
  puts(msg)
rescue RuntimeError => error
  puts error.inspect
end

hello #<RuntimeError: Empty message!>
Теперь в контексте обработчика ошибок мы имеем доступ к экземпляру ошибки, что дает нам возможность получить некоторые данные об ошибке:

def hello(msg = "")
  raise "Empty message!" if msg == ""
  puts(msg)
rescue RuntimeError => error
  puts error.message
  puts error.backtrace
end

hello
#=>Empty message!
#exceptions.rb:2:in `hello'
#exceptions.rb:9:in `<main>'
Создание собственных типов ошибок

Глядя на иерархию исключительных ситуаций можно увидить, что все исключительные ситуации происходят от класса Exception. Доказательство:

puts RuntimeError.superclass #StandardError
puts RuntimeError.superclass.superclass #Exception
Хотя все ошибки и происходят от класса Exception, вам следует использовать класс StandartError для наследования поскольку Exception слишком низкоуровневый класс, который обслуживает между всего прочего еще и ошибки окружения. Пример создания собственной ошибки:

class SomeError < StandardError
  def message
    "Some Error!"
  end
end

raise SomeError #exceptions.rb:7:in `<main>': Some Error! (SomeError)
=end