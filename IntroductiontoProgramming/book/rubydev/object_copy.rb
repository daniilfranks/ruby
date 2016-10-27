=begin 
В Ruby переменные — это просто ссылки на объект в памяти. Присваивая переменной значение, вы не самом деле ссылаетесь ей на объект. Присваивая переменной значение — другую переменную вы просто создаете две ссылки на один и тот же объект:

original = {
  :ruby => ["rails", "sinatra"],
  :erlang => ["chicago_boss", "nitrogen"]
}

another_var = original
Одинаковый object_id — значит и переменные ссылаются на один и тот же объект:

original.object_id #=> 72411200
another_var.object_id #=> 72411200

original[:ruby][0] = "Ruby on Rails"
another_var[:ruby][0] #=> "Ruby on Rails"
Для создания нового объекта — копии используют два метода — #dup и #clone. Ниже преведены примеры использования обоих.

duplicate = original.dup

original.object_id #=> 72411200
duplicate.object_id #=> 72298510

original[:erlang][0] = "Chicago Boss"
duplicate[:erlang][0] #=> "Chicago Boss"

original[:erlang][0].object_id #=> 71899560
duplicate[:erlang][0].object_id #=> 71899560
#dup создает shallow copy объекта. Что это узнаете ниже.

##А сейчас рассмотрим метод #clone:

clone = original.clone
original.object_id #=> 72411200
clone.object_id #=> 71139640

original[:ruby] << "Padrino"
clone[:ruby] #=> ["Ruby on Rails", "sinatra", "Padrino"]
#clone также создает shallow copy

##Что такое shallow copy?

Скажем так, существует 2 типа копий объекта: глубокие и мелкие копии. Shallow copy — в переводе означает «мелкая копия». Сейчас объясню почему.

#clone и #dup создают мелкие копии объектов, то есть копируют объект, но не составляющие его объекты. Если у нас есть массив строк, то делая его shallow copy мы получаем новый массив, но объекты — строки в нем будут те же. На практике это часто бывает бессмысленно, ведь действия выполненные над повторяющимися в обоих массивах элементами будут изменять элементы в обоих массивах, что небезопасно так как копирование объектов, чаще всего, нам необходимо в том случае, когда нам необходимо одновременно сохранить оригинальные данные и выполнить какие-то преобразования над ними. Используя shallow copy мы можем легко повредить оригинальные данные. Пример:

original = ["rails", "sinatra", "padrino"]
duplicate = original.dup

duplicate.each &:upcase!
duplicate #=> ["RAILS", "SINATRA", "PADRINO"]
original #=> ["RAILS", "SINATRA", "PADRINO"]
Как видите, оригинальные данные хранившиеся в переменной original были утеряны.

##Как быть, если необходима глубокая копия объекта?

В этом случае прибегают к трюку с использованием модуля Marshal. Marshal обладает 2 интересными методами: dump и load, первый (dump) позволяет закодировать объект в строку, чтобы потом, например, сохранить его в файл, а второй (load) позволяет восстановить объект из строки созданной методом dump. Ах да, эту строку называют дампом объекта, потому и название у метода такое — dump.

Выглядит эта техника следующим образом:

original = {
  :ruby => ["rails", "sinatra"],
  :erlang => ["chicago_boss", "nitrogen"]
}

deep_copy = Marshal.load(Marshal.dump(original))

original.object_id #=> 72729700
deep_copy.object_id #=> 72715820

deep_copy[:ruby][0] = "Ruby on Rails"
deep_copy[:ruby][0] #=> "Ruby on Rails"
original[:ruby][0] #=> "rails"
Пример попроще:

original = ["rails", "sinatra", "padrino"]
duplicate = Marshal.load(Marshal.dump(original))

duplicate.each &:upcase!
duplicate #=> ["RAILS", "SINATRA", "PADRINO"]
original #=> ["rails", "sinatra", "padrino"]
Как видите данная техника отлично работает и мы можем безопасно работать с данными.

При желании, можно добавить в класс Object метод #deep_copy, чтобы все было совсем «красиво»:

class Object
  def deep_copy
    Marshal.load(Marshal.dump(self))
  end
end

deep_copy = original.deep_copy
deep_copy.each &:upcase!

deep_copy #=> ["RAILS", "SINATRA", "PADRINO"]
original #=> ["rails", "sinatra", "padrino"]
Однако мне это кажется лишним потому, что необходимость в таких действиях возникает достаточно редко.

На этом можно было бы закончить статью, но мы кое-что упустили. Что? — Различие между методами #dup и #clone. Эти методы, хоть и оба выполняют создание shallow copy объекта, работают несколько отлично, то есть #clone не является синонимом для #dup — это действительно 2 разных метода!

##Так в чем же разница?

Разница в следующем — #clone выполняет несколько более сложную работу, чем #dup, эта более сложная работа заключается в следующих двух особенностях #clone:

#clone копирует singleton — класс объекта, то есть shallow-копие объекта доступны singleton методы скопированного объекта.
#clone сохраняет frozen-статус копируемого объекта. Пример:
original = {
  :ruby => ["rails", "sinatra"],
  :erlang => ["chicago_boss", "nitrogen"]
}

# создаем уникальный (singleton) метод объекта original
def original.framework_names
  self.values.flatten
end

original.singleton_methods #=> [:framework_names]
original.framework_names
#=> ["rails", "sinatra", "chicago_boss", "nitrogen"]

# "замораживаем" объект (объект нельзя изменять)
original.freeze
original.frozen? #=> true

# делаем копию с использованием #dup
duplicate = original.dup
duplicate.frozen? #=> false
duplicate.singleton_methods #=> []

# делаем копию с использованием #clone
clone = original.clone
clone.frozen? #=> true
clone.singleton_methods #=> [:framework_names]
=end