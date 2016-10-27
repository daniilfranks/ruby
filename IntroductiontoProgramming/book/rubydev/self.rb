=begin 
Честно сказать, достали меня уже вопросом о том, что такое self. Особено странно, что некоторые люди начинают работать с Ruby on Rails не разобравшись с самим языком Ruby. Ну как так можно? А?! Если лень читать книгу на 600 страниц — есть статьи на RubyDev, они не полностью корректные так как я писал их достаточно давно, но в общем достаточно годные, как мне кажется. Если нет желания прочитать краткие статьи, которые я пытался написать более чем понятным новичку языком, то, я думаю, что программирование — это не ваше. Ну да ладно. Напишу отдельную статью о self, хотя то, что такое self много где упоминалось в статьях на RubyDev.

self — это ссылка на текущий объект.

У каждого метода должен быть приемник — на то он и метод, а не функция, а если приемник не указан, то подразумевается, что приемником является self.

class A
  def hello_and_bye
    hello
    self.bye
  end

  def hello
    puts "Hello!"
  end

  def bye
    puts "Bye!"
  end
end

A.new.hello_and_bye
# Hello!
# Bye!
Разницы нет, использовали мы self или нет, но оба метода #hello и #bye были успешно выполнены.

А вот где есть разница:

class B
  def id_and_class
    puts "id: #{object_id} | class: #{self.class}"
  end
end

B.new.id_and_class
# id: 73604460 | class: B
У объектов имеется метод #class, который возвращает клас, экземпляром которого является объект, однако, существует также зарезервированное слово class, которое используется для объявления класса и вот, чтобы не было многозначности, class — это всегда объявление класса, а потому метод #class всегда следует вызывать указывая объект — приемник явно, то есть: self.class.

self — ссылка на экземпляр класса в методах экземпляра класса, так же как переменные объекта являются переменными экземпляра класса только будучи объявлены в методах экземпляра класса. В контексте тела класса (методов класса и вне их) self является ссылкой на сам класс.

class C
  def self.self
    self
  end
end

C.self #=> C
Этот страшный код, на самом деле объявляет метод .self для объекта self (класса С), который просто возвращает self (класс С). Таким образом Класс C через метод .self возвращает сам себя. Чудно, да?

self используется в трех случаях:

* Для определения методов класса

# так:
class C
  def self.self
    self
  end
end

# или так:
class C
  class << self
    def self
      self
    end
  end
end
* Когда нам нужно явно указать приемник для вызова метода

class D
  def hello
    puts "Hello!"
    bye = "Bye!"
    puts bye
  end

  def bye
    "Trololo"
  end
end

D.new.hello
# Hello!
# Bye!

class E
  def hello
    puts "Hello!"
    bye = "Bye!"
    puts self.bye
  end

  def bye
    "Trololo!"
  end
end

E.new.hello
# Hello!
# Trololo!
* Когда в качестве значения в метод или блок кода объект должен передать сам себя

def puts_id_of_obj(obj)
  puts "Id of object is: #{obj.object_id}"
end

class F
  def puts_my_id
    puts_id_of_obj self
  end
end

F.new.puts_my_id
# Id of object is: 74423470
Может есть еще какие-то экзотические случаи, но на ум ничего не пришло. Если знаете — пишите в комментариях.

Не начинайте работать с Rails, не поняв работы с Ruby. Понимание self — это самые азы, как же можно работать с Rails не зная метапрограммирования, которым пропитан фреймворк насквозь? А я уверен, что вы не знаете метапрограммирования, потому, что это сильно более сложная тема, чем self. this в JavaScript несколько сложнее self, и я уверен, что не понимая self в Ruby вы не понимаете и this в JavaScript, и наоборот. Вы не знаете ни Ruby, ни Javascript, а пытаетесь использовать один из самых современных и full-featured веб-фреймворков?! А атомную станцию не зная элементарной физики вы сможе построить? А маленькие дети могут ходить по канату не умея даже стоять?
=end