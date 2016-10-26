p ["a","b","c"].map(&:capitalize)

class Translator
	def speak &language
		language.call(self)
	end

	protected

	def french
		"bon jour"
	end

	def spanish
		"hola"
	end

	def method_missing *args
		"awkward silence"
	end
end

translator = Translator.new
p translator.speak(&:french)
p translator.speak(&:spanish)
p translator.speak(&:italian)

=begin 
Вы, вероятно, видели этот пример в предыдущем посте, ну или в каком-нибудь другом коде на Ruby:

[ruby]['a', 'b', 'c'].map(&:capitalize) #=> ["A", "B", "C"]
[/ruby]
Это интересный трюк благодаря которому код выше эквивалентен следующему коду:

['a', 'b', 'c'].map{|letter| letter.capitalize}
Большинство программистов на Ruby знакомы с этой идиомой и частенько используют ее, однако вы, должно быть, не знаете, как это работает, если читаете эту статью.

Вся магия состоит из двух частей: это унарный оператор амперсанд и символ, который был передан оператору.

Когда Ruby видит унарный амперсанд с последующим аргументом – символом он пытается конвертировать его в объект proc (блок кода) и запустить этот блок. Ruby делает это вызывая метод to_proc. Немного истории: В Ruby on Rails 1.1 был добавлен метод to_proc для класса Symbol, таким образом вы должны передавать символ унарному амперсанду (как например &:capitalize) и он будет конвертировать символ :capitalize в блок кода (по сути это является созданием блока кода в контексте которого вызывается метод capitalize). Начиная с Ruby 1.8.7 этот метод был включен в сам Ruby, по другим данным он был портирован в 1.8.7 уже из ветки 1.9, в любом случае вам нет необходимости использовать Ruby on Rails для того, чтобы иметь возможность воспользоваться методом to_proc.

Давайте создадим класс Translator со всего одним public методом speak. Этот класс имеет метод для каждого языка, который ему известен и ловит все методы для языков, которые не знает при помощи method_missing:

class Translator
  def speak &language
    language.call(self)
  end

  protected

  def french
    'bon jour'
  end

  def spanish
    'hola'
  end

  def turkey
    'gobble'
  end

  def method_missing *args
    'awkward silence'
  end
end
Теперь давайте поиграем с этим кодом в irb:

irb(main):001:0> require ‘translator.rb’
=> true
irb(main):002:0> translator = Translator.new
=> #
irb(main):003:0> translator.speak(&:spanish)
=> «hola»
irb(main):004:0> translator.speak(&:turkey)
=> «gobble»
irb(main):005:0> translator.speak(&:italian)
=> «awkward silence»

Основа такого поведения заключается в методе speak:

def speak &language
  language.call(self)
end
Ruby конвертирует символ :turkey в блок кода а затем вызывает этот блок кода передавая ему в качестве аргумента объект-приемник в контексте которого будет производиться вызов. В нашем случае мы вызываем :turkey для объекта self, что эквивалентно следующему выражению: self.turkey.
=end