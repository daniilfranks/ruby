=begin 
Сегодня немного налажал с кодом и решил написать статью так сказать для закрепления представлений о хорошем коде в голове, ну и разумеется для того, чтобы поделиться имеющимися бедными познаниями с другими новичками. Более-менее опытным разработчикам все это уже, наверняка, известно, поэтому, если вы себя таковым считаете — можете не читать.

1. Используйте && и || вместо AND или OR.(в комментариях подсказывают, что они все же отличаются разным приоритетом).

Вместо:

if arr.size <= 10 OR (arr.size >= 5 AND arr[1] == 'first')
Лучше:

if arr.size <= 10 || (arr.size >= 5 && arr[1] == 'first')
2. Используйте для указания уровня вложенности кода двойные пробелы, вместо табуляций

Вместо:

class Example
       def ex_method(arg)
              puts "something"
              arg.each do |a|
                   puts a
              end
       end
end
Лучше:

class Example
  def ex_method(arg)
    puts "something"
    arg.each do |a|
      puts a
    end
  end
end
3. Используйте осмысленные имена методов, переменных и т.д.

Вместо:

var = 36.6
m = %w{January February March April May June July Augest September October November December}
Лучше:

body_temperature = 36.6
months = %w{January February March April May June July Augest September October November December}
Bang! — методы — это методы, которые изменяют состояние объекта. не забывайте, что имена таких методов должны, как уже сложилась традиция заканчиваться знаком восклицания.

Знаком вопроса заканчиваются имена методов, которые в качестве результата работы возвращают булевый тип: true или false. В PHP такие методы еще именуют как is_<имя метода>.

4. Страйтесь максимально отказаться от циклов в пользу итераторов. Итераторы — это Ruby Way!

Вместо:

for i in args do
  puts i
end
Лучше:

args.each{|i| puts i}
5. Используйте фигурные скобки «{}» только для обрамления однострочных блоков кода.

Вместо:

args.each {|user|
  user.posts.each {|post|
    post.comments.each{|comment|
      puts comment
    }
  }
}
Лучше:

args.each do |user|
  user.posts.each do |post|
    post.comments.each do |comment|
      puts comment
    end
  end
end
Вместо:

1000.times do |num| puts num; end
Лучше:

1000.times {|num| puts num}
6. Оставляйте пробелы между операторами

Вместо:

num = 12/3*(34-5)+args.count/4
Лучше:

num = 12 / 3 * (34 - 5) + args.coutn / 4
Вместо:

if a>b&&c<b
Лучше:

if a > b && c < b
7. В Ruby все имеет значение true или false. Отказывайтесь от использования if для возврата true или false:

Вместо:

if a > b && c < b
  true
else
  false
end
Лучше:

a > b && c < b
8. Используйте одноименные операторы

Вместо:

a > b && c < b
Лучше:

a > b && b > c
9. Используйте параллельное присваивание

Вместо:

a = 10
b = 15
c = 20
Лучше:

a, b, c = 10, 15, 20
a, b, *c = [...] # если в коллекции больше 3 элементов, то с заберет на себя все оставшиеся после a и b значения.
10. Форматируйте или разбивайте длинные строки

Вместо:

@somethong = do_somethong :conditions => {:size => '23', :weight=> '56', :height => '165', :eyes_color=> 'blue', ...}
Лучше:

@somethong = do_something :conditions => {
                       :size => '23',
                       :weight=> '56',
                       :height => '165',
                       :eyes_color=> 'blue',
                       ...}
Старайтесь избегать длинных строк кода и разбивать их на более короткие или форматировать в вышеприведенный способ. Оптимальной длиной считается строка кода до 70-80 символов.

Используйте специальный синтаксис для многострочных литералов:

Вместо:

@welcome_msg = "Ruby is…\nA dynamic, open source programming language \nwith a focus on simplicity and productivity.\nIt has an elegant syntax that is natural\nto read and easy to write."
Лучше:

@welcome_msg = <<msg

===== WELCOME =====
Ruby is…
A dynamic, open source programming language
with a focus on simplicity and productivity.
It has an elegant syntax that is natural
to read and easy to write.
msg
11. Оператор return не является обязательным, однако его использование является хорошим стилем

def name
  @name
end
Однако при написании более сложных и крупных по размеру методов желательно использовать return для явного указания значения, которое будет возвращено.

12. Минимизируйте код в методах и блогах

Большие методы следует разбивать на более мелкие, это будет способствовать повторному использованию кода (принципу DRY), а также сделает код более читабельным.

Вместо:

def reverse_qube_diff(a)
  [a, a.to_s.reverse.to_i, a - a.to_s.reverse.to_i, (a - a.to_s.reverse.to_i) ** 3]
end
Лучше:

def num_reverse(n)
  n.to_s.reverse.to_i
end

def qube(n)
  n**3
end

def reverse_qube_diff(a)
  [a, num_reverse(a), a - num_reverse(a), qube(a-num_reverse(a))]
end
Пример не совсем хорошо показывает пользу такого подхода, но это первое, что пришло мне в голову. Если у вас есть пример лучше — напишите его в комментариях и я добавлю его в статью. Оптимальный размер метода до 7 строк. Это не означает, что вы должны все ваши методы разбивать до такой степени, главным здесь является выноска используемого несколько раз кода в отдельные метода, а также выноска крупных блоков кода.

13. Комментируйте код
Часто бывает сложно понять даже собственный код, который писался всего-то неделю назад. Для того, чтобы быстро вспомнить, что же вы там воротили, и чтобы программист работающий с вашим кодом мог быстрее войти в суть творящегося, следует обильно комментировать код. «Обильно» не значит, что закомментирован должен быть каждый метод, комментируйте, в первую очередь, API для пользователей вашего кода, методы, которые не используются на прямую могут документироваться очень кратко в формате «для себя». Небольшие, простые методы не следует документировать, это лишняя трата времени.

# Меняет порядок разрядов числа на обратный
def num_reverse(n)
  n.to_s.reverse.to_i
end

def qube(n)
  n**3
end

#Возвращает массив:
#0 => число, аргумент метода
#1 => числом производное от аргумента метода с обратным порядком разрядов
#2 => разница между аргументом и производним от него числом с обратным подядком разрядов
#3 => [2] возведенное в куб
def reverse_qube_diff(a)
  [a, num_reverse(a), a - num_reverse(a), qube(a-num_reverse(a))]
end
14. Не бойтесь синтаксического сахара

Вместо:

if @args.empty?
  puts "Error: Array is empty"
else
  @args.each{|a| puts a}
end
Лучше:

puts @args.empty? ? "Error: Array is empty" : @args.each{|a| a }
Используйте новый (начиная с Ruby 1.9.х) синтаксис для символов-ключей:

Вместо:

args = {:sunday => 127, :monday => 245, :tuesday => 312, :wednesday => 347, :thursday => 320, :friday => 250, :saturday => 0}
Лучше:

args = {sunday: 127, monday: 245, tuesday: 312, wednesday: 347, thursday: 320, friday: 250, saturday: 0}
15. Определяйте собственный метод to_s
Метод to_s имеется у каждого объекта и используется для строкового представления объекта. Метод puts использует метод to_s для получения строкового представления, которое и будет напечатано. Пример:

args = MyHashImp.new sunday: 127, monday: 245, tuesday: 312, wednesday: 347, thursday: 320, friday: 250, saturday: 0

class MyHashImp < Hash
  def initialize hash
    @hash = hash
  end

  def to_s
    output = ""
    max = 0

    @hash.each_key do |k|
      max < k.size ? max = k.size : false
    end

    @hash.each{|k, v|
      output = output + "#{k} #{" " * (max - k.size)} store  #{v}\n"}
      return output
    end
end

puts args

sunday        store  127
monday       store  245
tuesday       store  312
wednesday  store  347
thursday      store  320
friday           store  250
saturday      store  0
16. Используйте пустые строки для разделения фрагментов кода
Используйте пустые строки для разделения, например, объявления методов, инициации переменных, блоков кода.

Вместо:

class MyHashImp < Hash
  def initialize hash
    @hash = hash
  end
  def to_s
  output = ""
  max = 0
  @hash.each_key do |k|
    max < k.size ? max = k.size : false
  end
  @hash.each{|k, v| output = output + "#{k} #{" " * (max - k.size)} store  #{v}\n"}
    return output
  end
end
Лучше:

class MyHashImp < Hash
  def initialize hash
    @hash = hash
  end

  def to_s
    output = ""
    max = 0

    @hash.each_key do |k|
      max < k.size ? max = k.size : false
    end

    @hash.each do |k, v|
      output = output + "#{k} #{" " * (max - k.size)} store  #{v}\n" 
    end

    return output
  end
end
Таким образом вы разбиваете код на логические фрагменты и улучшаете его читабельность. Это особенно актуально для крупных блоков кода и методов.

17. Основной код должен относиться на первом месте

Вместо:

puts @args.empty? ? "Error: Array is empty" : @args.each{|a| a }
Лучше:

puts !@args.empty? ? @args.each{|a| a } : "Error: Array is empty"
Сюда же можно отнести использование unless вместо if. Лично мне больше нравится !<условие>, вместо unless.

18. Используйте CASE вместо группы IF или IF — ELSIF когда проверяется переменная

Вместо:

puts 1 if a = 1
puts 2 if a = 2
puts 'indefinite' if a = 10_000
Или:

if a = 1
  puts 1
elsif a = 2
  puts 2
elsif a = 10_000
  puts "indefinite"
end
Лучше:

puts case a
when 1
  1
When 2
  2
when 10_000
  "indefinite"
end
19. Разбивайте регулярные выражения на более мелкие шаблоны

Вместо:

tel = '38-096-2870-430'
pattern = /^([\d]{2})-([\d]{3})-([\d]{4}-[\d]{3})$/
m = tel.match(pattern)
Лучше:

tel = '38-096-2870-430'
state = /([\d]{2})-/
station = /([\d]{3})-/
phone = /([\d]{4}-[\d]{3})/

pattern = /^#{state}#{station}#{phone}$/
m = tel.match(pattern)
Разбиение шаблона на логические части позволяет легче воспринимать синтаксис регулярных выражений, а также несколько упрощает их разработку и способствует чистоте кода, хотя количество строк и увеличилось.

Статья будет пополняться новыми рекомендациями. Пишите свои рекомендации в комментариях, и они будут добавлены в статью.

Некоторые из приведенных выше рекомендаций являются де-факто стандартом написания кода.
=end