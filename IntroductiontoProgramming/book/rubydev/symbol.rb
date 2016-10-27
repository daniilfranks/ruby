=begin
Еще раньше хотел написать эту статью, но забывал об этой своей идее. Сегодня вспомнил благодаря письму, пришедшему мне на email в котором меня попросили написать о том, что такое Символ в Ruby, где он используется и т.д. В общем пишу…

В интернетах наталкивался на несколько объяснений о том, что собой являют символы в Ruby. Все они начинали так: «Символ в Ruby — это экземпляр класса Symbol»… Ну да, символ — экземпляр класса Symbol, однако что нам это дает?

Из-за того, что в статьях посвященных символам все описывается туманно, или как в серьезных научных трудах, написанных одними бородатыми дядьками для других, не менее бородатых, дядек и процветает массовое непонимание этой концепции.

Чтобы понять, что есть вещь, необходимо понять, для чего эта вещь необходима. Чтобы писать меньше слов, я решил немножко визуализировать то, что хочу сказать, для этого я подготовил небольшой графический материал:

ruby symbol

Как видно из примера было создано два массива состоящих из хэшей. Единственное отличие между ними, это то, что в хэшах составляющих первый массив в качестве ключей используются строки, а во втором — символы. Мы также видим, что в первом случае было создано 4объекта — ключа, а во втором только два. Но почему так?

В этом и заключается основное отличие символов от строк. Дело в том, что строки «god save the queen», «god save the queen», «god save the queen» — это 3 разных объекта не смотря на то, что они абсолютно идентичны! В это же время символы :» god save the queen», :» god save the queen», :» god save the queen» — это всего один объект!

Можно сказать, что символы — это потомки строк, они абсолютно идентичны строкам с тем лишь отличием, что для одинаковых символов создается лишь один объект, а для одинаковых строк — по одному объекту на каждую строку. Начиная с Ruby 1.9 символы стали еще больше походить на строки, так как теперь символы также можно проверять на соответствие регулярному выражению.

Возникает вопрос: Зачем необходимо это различие? Как вы уже заметили, символы сами по себе практически не используются, они используются в основном в хэшах в качестве ключей. Это связано с тем, что ключ в виде символа так же удобен, как и ключ в виде строки, однако он лишен недостатка строк, который был описан выше.

Если у нас имеется массив пользователей из нескольких тысяч записей, где каждый Объект-пользователь, обладает такими свойствами, как id, name, login, password, reg_at, last_visit_at, address, то используя в качестве ключей — символы мы создадим всего 7 объектов — экземпляров класса Symbol, а используя в качестве ключей строки, мы создадим N*7 (где N — число объектов-пользователей), то есть несколько тысяч объектов только для того, чтобы хранить ключи в памяти компьютера (а ведь ключи — это побочные данные, которые нам необходимы только для удобства работы). Таким образом, приходим к выводу, что введение символов — это способ оптимизации в первую очередь потребления оперативной памяти компьютера.

Что еще отличает символы от строк?

Символы статичны! Вы не можете изменить символ (убедитесь сами, у символов нет многих методов свойственных строками типа .capitalize и т.д.), но легко можете изменить строку. Это отличие происходит от первого, описанного выше, которое в свою очередь произошло от необходимости оптимизации и такого свойства ключей ассоциативных массивов (хэшей), как неизменяемость. Вам когда-либо приходилось каким-либо образом изменять ключи в хэшах (я имею, введу сами ключи, а не структуру хэша)?

Даже если вы и теперь не поняли, что такое символ, то просто запомните: Символы используются только в качестве ключей и только их следует использовать в качестве ключей, если стоит выбор между использование символов и строк.

Некоторые особенности работы с символами

Работа с символами абсолютно идентична с работой с ключами любого-другого типа. Единственное отличие появилось в Ruby 1.9, когда для символов — ключей был предложен новый синтаксис:

# Вместо:
h = {:Vasya => {:age=>22, :height => 175, :weight => 80}}
# мы можем использовать более лаконичный синтаксис:
h = {Vasya: {age: 22, height: 175, weight:  80}}
Согласитесь, новый синтаксис гораздо удобнее!

Разрыв шаблона

После прочтения этой статьи вы наверняка стали убеждены в том, что символы используются только в качестве ключей, однако это не совсем так. Благодаря методу to_proc, ключи приобретают еще одно «магическое применение».

Метод to_proc позволяет конвертировать символ в блок кода. Как это «конвертировать символ в блок кода»? Я и сам не мог понять, почему это так называется, потому, что конвертировать символ в блок кода невозможно! Возможно, взять символ :capitalize и создать блок кода в котором будет вызываться метод capitalize. Ничего более!
Вот как выглядит метод to_proc:

def to_proc
  proc { |obj, *args| obj.send(self, *args) }
end

Вот пример использования:

a = :capitalize.to_proc  #=> #
a.call("hello world!") #=> Hello world!
По-сути, метод to_proc оборачивает метод в экземпляр объекта Proc, который в отличие от метода можно присвоить переменной. Это «оборачивание» происходит как видно из кода метода to_proc благодаря методу send, который просто вызывает метод соответствующий символу. Таким образом, в переменной a хранится процедура, которая в своем контексте вызывает метод и которая может быть вызвана при помощи метода call. То есть в переменной a хранится блок кода:

a = proc {|arg| arg.capitalize}
Ruby to_proc method
Вызов метода a.call(«hello») вызывает этот блок кода с параметром «hello». Все предельно просто!

Из всего этого становится понятно, что символы могут использоваться еще и как аргументы для вызова некоторых методов. Но абсолютно так же можно использовать и строки (не всегда, некоторые методы ожидают конкретно аргумента символьного типа). Пример:

attr_accessor :some_method
attr_accessor 'some_method'
Оба варианта абсолютно эквивалентны.

Преобразования символов в строки и обратно

Преобразовать символ в строку очень просто, остаточно использовать метод to_s:

:symbol.to_s  #=> "symbol"
Как же мы можем преобразовать строку в символ? — Все очень просто:

a = 'string'
b = eval(":#{a}") #=> :string
Правда, все просто? На самом деле это была шутка, все преобразование строки в символ выглядит еще проще благодаря методу to_sym:

'string'.to_sym #=> :string
Интересное поведение

Работая над этой статьей я обнаружил некоторое интересное поведение символов, оно заключается в том, что :symbol и :’symbol’ — это один и тот же символ, что проверяется очень просто:

:'symbol'.object_id #=> 332264
:symbol.object_id #=> 332264
Пока не знаю где это можно использовать и буду благодарен если кто-то поделится примером применения такого поведения.

UPD: Еще одна важная особенность символов о которой я забыл упомянуть

Как сравниваются строки? — Строки сравниваются путем сравнения их символов, т.е. строка А будет соответствовать строке B только если A[x] = B[x], т.е. все соответствующие символы равны.

Как же сравниваются символы? Символы преобразуются в численное представление (хеши). Далее символы сравниваются по сгенерированным для них числам. Такое сравнение работает гораздо более быстрее.  Что значит сравнение? — Это значит, например, поиск по ключу в ассоциативном массиве  состоящем из нескольких тысяч или миллионов пар ключь => значение. В этом случае выигрыш в скорости благодаря использованию символов будет весьма значительным.
=end