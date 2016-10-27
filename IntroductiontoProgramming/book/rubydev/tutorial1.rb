=begin 
Философско-исторический яспект языка программирования Ruby

Раньше люди пользовались пальцами, камушками и палочками для произведения простых расчетов. Это были совсем примитивные орудия умственного труда, которые с течением времени и роста человека, как человека разумного начинали приобретать более сложный вид, боле расширенный диапазон операций и все большую вычислительную способность. Таким образом в конце консов человечество получило компьтеры — не совсем умные, но совсем исполнительные машины. Вы можете думать, что компьютер умнее вас, что же это ваше право, вот только компьютер был создан человеком, и все, что он умеет делать — это выполнять его, человека, команды. Компьютер так туп, что не способен понимать человеческий язык, поэтому человек был обязан создать для компьютера собственный язык, который бы тот понимал, и которым так же хорошо должен был бы владеть человек. Компьютерные языки были достаточно неудобны в использовании, человек носящий громкое имя Человек стал уподоблять себя машине общаясь с машиной на ее же языке. Это многим не нравилось, но многим людям доставляло удовольствие. Вы знаете как называются такие люди, которые любят боль и унижения.

Так продолжалось до тех пор, пока один программист родом из страны восходящего Солнца и уже зашедших за горизонт самураев не решил изменить ход событий. Имя ему не Якихиро Мацумото — именно он является создателем языка Rubyю. В 1993 году родился маленький скукоженый Ruby, он кричал и почти ничего не умел, в 1995 вышла его первая версия, которая уже могла ходить и просить кушать. Сейчас Ruby возмужал и стал действительно мощным и популярным языком программирования, а самое главное — этот язык программирования, он человеко-ориентированный! Ruby — это практически тот язык, на котором говорит человек, именно по этой причине Ruby называется высокоуровневым языком программирования! Для того, чтобы компьтер понимал человеко0ориентированный язык, у Ruby имеется интерпретатор, это такой переводчик человеко-ориентированного языка в язык понятный компьютеру.

Ruby позволяет вам описывать свои мысли и желания так, что ваш код можно читать на одном вздохе, естественно, если вы являетесь хорошим писателем. Поверьте, как бы люди не хвалили Ruby, каким бы идеальным языком он не был, вы всеравно сможете писать, то, что программистский народец называет Говнокодом (от лат. Govnos и Codus). Задачей данного учебника является не просто систематизация моих знаний, их углубление и предоставление вам, моим дорогим читателям, уже переваренной и обогащенной витаминами пищи, но и выработка хорошего стиля написания кода, такого, чтобы ваш код был сравним с романами Жюля Верна.

Практический аспект
Всему, что написано выше можно верить, а можно не верить и забросать автора камнями, поверьте, мне бы этого не хотелось. Для того, чтобы камни не летели я просто-таки обязан аргументировать все вышесказанное, приправив дополнительными аргументами в пользу использования Ruby.

Ruby высокоуровневый язык программирования (ЯП). Ruby позволяет сместить акцент при написании кода больше в сторону «что делать», и уйти от объяснения тупому компьютеру «как делать». Объяснением того, как выполнить ваше желание занимается переводчик — интерпретатор языка Ruby. Не гоже господину на прямую общаться со своими рабами, на их совершенно неотесанном языке. Японцы очень гордый народ, народ потомков самураев, в котором все еще тлеют феодальные замашки.

Ruby интерпретируемый язык программирования. Я уже говорил, что если вы прикажите этой тупой железяке 5.times{puts «hello!»}, то она не поймет этого без интерпретатора. Языки программирования требующие интерпретатора, который читает скрипты, написанные на них называются интерпретируемыми языками. Языки, коды которых превращаются в программу называются компилируемыми. Разница состоит в том, что компилируемые программы компилируются один раз для множественного использования, а программы написанные на интерпретируемых языках интерпретируются каждый раз при своем запуске, из-за чего являются более медленными.

Скорость важна, но это не самое главное. Ruby гораздо медленнее Си и еще медленнее Asembler’а, но это не мешает Ruby приобретать все новых и новых поклонников, которые сжигают образы своих старых богов и обращаются в новую религию Ruby-программизма. Ruby позволяет писать приложения так быстро, что вы обанкротитесь нанимая спецотряд программистов на Си, которые напишут программу выполняющую те же действия. Кроме того, если вам нужно посчитать до завтра какой-нибудь финансовый расчет, то имеет ли для вас разницу то, будет он считаться 10 секунд или 0.1 секунду? Даже если для вас будет действительно важна производительность, то у Ruby имеется огромное количество драйверов к библиотекам написанным на Cи, к различным базам данных и прочему программному обеспечению, таким образом получаете скорость Cи при этом пишите код на Ruby. Ruby также позволяет писать расширения на Си для критичных участков кода, то есть таких, где производительность крайне важна (все это потому, что Ruby сам написан на Си, не полностью, но довольно большой своею частью). Вам стоит привыкнуть к тому, что нет универсального языка программирования, зная который, вам больше ничего не нужно будет знать.

Ruby многолик. Есть стандартная реализация Ruby, она носит имя Matz Ruby Interpreter (MRI). Начиная с ветки 1.9. используется другой интерпретатор YARV. Также существует Ruby для виртуальной Java — машины (JRuby), который позволяет использовать все множество библиотек написанных на Java и других языках выполняемых на JVM, например Scala или Clojure. Существует MacRuby — версия для Mac OS X. Существует Ruby Enterprise Edition (Ruby EE или REE) — это несколько переделанный MRI, который позволяет программам на Ruby потреблять меньше оперативной памяти. Существуют также различные авторские наработки, которые позволяют заменять оригинальные компоненты Ruby на более функционально богатые и быстрые, однако в силу того, что такие наработки, как правило, плохо испытаны в боевых условиях и не имеют широкого распространения, я бы не рекомендовал вам использовать их. Используйте официальные версии Ruby — MRI (1.8.7) и YARV (1.9.2). Помимо описанных реализаций Ruby существует еще большое количество, например Rubinius и Ruby MagLev и так далее. В чем их особенность я не знаю, но обязательно разберусь и опубликую в одной из следующих версий учебника.

Ruby — динамический язык программирования. Это значит, что программы на Ruby являются динамичными, они могут изменяться непосредственно в момент исполнения. Ruby обладает очень широкими возможностями метапрограммирования, такими, что им позавидует любой язык. Главное заключается в том, что это не просто понты, а это реально эффективный подход к программированию, который позволяет писать реально мощные приложения.

Ruby лаконичен. Программы написанные на Ruby очень кратки и понятны. Виной тому и его высокоуровневость и динамичность и слабая типизированность. Я не знаю таких языков, которые выигривали бы у Ruby по наименьшему числу строк кода для реализации определенного функционала. Подозревая что такие имеются, но что-то с ними не ладное, если о них не слышно.

Ruby — слаботипизированный язык программирования. В некоторыйх других языках программирования вам необходимо было бы объявлять тип хранимых в переменной данных, при этом переменная не может хранить данных другого типа. Адепты программирования во главе с Якихиро Мацумото потрудились над тем, чтобы вы могли использовать переменные для хранения абсолютно любых значений без предварительного их объявления.

Ruby — объектно-ориентированный язык программирования. Объектно-Ориентированный подход к программирванию уже совсем не нов и доказал не только свое право на жизнь, но и свою эффективность! Объектно-ориентированное Программирование (ООП) давно считается синонимом качества и масштабируемости кода. ООП достатоно популырный подход к разработке программного обеспечения, который упрощает и ускоряет разработку, делает код более понятным и структурированным и расширяемым. В Ruby ООП реализовано особо изящно, не обошлось без магии на уровне базовых классов, однако это не так уж важно принимая во внимание реализация языка в общем.

Ruby — простой язык программирования. Ruby простой для понимания язык программирования, простой для разработки, но не для изучения. Разумеется, приложение выводящее на экран классическую фразу «hello world» вы можете написать уже в первую секунду знакомства, кстати вот она: puts «helo word!», однако чтобы добиться истинного мастерства, вам следует потратить годы! Нельзя сравнивать Ruby с PHP, это как сравнивать элегантного лебеда с каким-то гусем, однако я пойду на такую жертву и сделаю это. Сам по себе язык Ruby не на много сложнее PHP в изучении, однако на много удобнее его и логичней. Сложнее сама экосистема Ruby, так как Ruby программисты привыкли все автоматизировать, и я наверное скажу не просто правду, но и истину, когда сообщю вам, что Ruby’исты продвинулись в этом куда дальше, чем какое-либо другое сообщество программистов. Эта автоматизация вынуждает разработчика изучать множество сторонних технологий, зато упрощает и сокращает затраты времени на побочные процессы разработки (тестирование, разворачивание приложения на сервере, и так далее). В PHP всего этого нет, либо все это совсем примитивно! Самое интересное, что порядка 25% PHP программистов не пользуются фреймворками и тонами плодят говнокод, попробуйте найти Ruby программиста, который не знаком с фреймворком Rails!

Ruby и Rails тили-тили тесто! Rails, или Ruby on Rails — это фреймворк для создания веб приложений, который написан на Ruby. Rails — это реально переворот в мире веб разработки. Rails — это очень мощный фреймворк, который использует по максимуму все возможности Ruby, который обладает огромным сообществом профессиональных программистов, который плодят качественный расширения для и так богатого функционала.

Ruby — это все-таки мейнстрим технология! Многие говорят, что Ruby это мало популярный язык программирования, однако он в ходит в 10 самых популярных ЯП, имеет огромное сообщество и окромное количество библиотек — rubygems. Кстати, наличие у Ruby gem’ов — еще одно его преимущество над PHP! В PHP есть унылый Pear, который пишется обезъянами, об этом можно судить по тому, в кодах Pear найдено много помета похожего на человеческий, но мы то знаем, что люди на это не способны. И вообще я только что согрешил сравнивая RubyGems и Pear. На Ruby реализовано огромное количество крупных успешных проектов, что доказывает удачный выбор Ruby в качестве составляющего звена про построении бизнеса основаного на веб проекте. Ruby, как и Python также входящий в 10 самых популярных языков программирования, лишен одного очень большого изьяна мейнстримных технологий — Ruby не перенасыщен программистами, программисты на Ruby все еще дефицит, а значит ваша будущая зарплата в роли Ruby программиста будет гораздо больше по сравнения с теми. кто программирует на PHP или Java. Даже если спрос на Ruby программистов будет полностью удовлетворен, Ruby программист будет зарабатывать больше потому, что есть два очень важных фактора: более высокое качество кода и более высокая производительность труда.

Rubyist’ы — самая тестолюбивая тусовка. Я не знаю, так ли это, но то, что программисты на Ruby продвинулись явно очень далеко в тестировании собственного кода — это факт! Каждый более-менее опытный Ruby программист пишет спецификации и/или тесты для своего кода. Это делает код на Ruby более надежным и качественным.

Ruby сообщество более квалифицировано, чем многие другие сообщества. В первую очередь речь идет о PHP — сообществе, которое весьма плодовито в выращивании уродов. Не каждый, кто программирует на Ruby достоен звания программиста, например я не достоин, потому, что имею крайне малый опыт и совсем недостаточный набор знаний, однако, если брать среднюю температуру по больнице, то сообщество Ruby значительно превосходит сообщество PHP. Не буду говорить о дугих языках программирования, так как Python, Java, и Perl являются основными экспортерами новых членов в сообщество Ruby, то есть многи программисты на Ruby добились своего мастерства работая с другими языками программирования и набрав достаточныйй багаж знания и опыта обратились в религию Ruby. Кроме того, многие люди, которые программируют на Ruby программируют и на Python и на Perl и на Java, Си, Objective-C, JavaScript, и, вы даже не поверите, на PHP.



Установка Ruby


Ruby доступен практически для всех возможных платформ, однако я бы вам рекомендовал использовать Mac OS X или один из дистрибутивов Linux, лично я использую Ubuntu — это очень удобная и дружественная по отношению к пользователю операционная система. Поскольку я использую Ubuntu, то буду описывать процесс установки конкретно для данной операционной системы. В моем блоге уже имеются статьи об установке, где, кстати описан процесс установки на Windows, однако данный учебник был бы не полным, если бы я не описал процесс установки Ruby.

Для установки Ruby я бы рекомендовал использовать RVM — Ruby Version Manager, который позволяет сразу устанавливат несколько версий Ruby и легко между ними переключаться. Я являюсь сторонников Ruby v. 1.9.2, поэтому конкретно этой версии будет посвящен учебник и конкретно эту версию Ruby вам необходимо установить.

Для установки RVM, вам предварительно необходимо утановить Git, для этого откройте консоль и выполните следущую команду:

$ sudo apt-get install git-core

Далее следует команда установки самого RVM:

mkdir -p ~/.rvm/src/ && cd ~/.rvm/src && rm -rf ./rvm/ && git clone —depth 1 git://github.com/wayneeseguin/rvm.git && cd rvm && ./install

Данная команда скачивает исходники RVM с удаленного репозитория на GitHub и затем запускает скрипт выполняющий установку.

После установки RVM вам необходимо найти файл .bashrc или .bash_profile и поместить туда следущую строку кода: [[ -s "$HOME/.rvm/scripts/rvm" ]] && . «$HOME/.rvm/scripts/rvm» для того, чтобы RVM был доступен из консоли. После этого сохраните изменения в файле и обновите консоль при помощи команд:

Если вы открывали файл .bashrc, то:
$ source ~/.bashrc

Или , если вы открывали .bash_profile:
$ source ~/.bash_profile

После этого вам следует проверить правильно ли установился RVM:

$ type rvm | head -1

Приведенная выше команда должна вернуть следущий ответ: rvm is a function, это означает, что RVM успешно установлен и готов к работе.

После установки RVM приступим к установке самого Ruby через RVM. Ниже приведена команда, которая сообщит вам все доступные для установки версии Ruby:

$ rvm list known

Вам все эти версии не нужны, просто установите самую свежую версию YARV 1.9.2-p180:

$ rvm install ruby-1.9.2-p180

Сразу после установки Ruby готов к работе! Для использования Ruby необходимо в консоли вызвать команду ruby и передать ей в качестве аргумента адрес файла с кодом. Файл с программой на Ruby должен иметь расширение .rb:

$ ruby /path_to_your_code/your_programm.rb

Более удачным решением во время изучения Ruby по данному учебнику будет являться использование интерактивного Ruby (irb), который позволяет вводить и испытывать код непосредственно в консоли:

vladimir@egoholic:~$ irb
ruby-1.9.2-p0 > puts «hello»
hello
=> nil

Структура программы

Любой язык программирования состоит из выражений. Выражением может быть присвоение переменной значения, может быть просто литерал, либо сложный фрагмент кода. Выражение — достаточно абстрактное понятие, которое стоит воспринимать просто как «базовый фрагмент код» или «простейшее действие», например 2 + 3 — это выражение, Sphere < Circle — тоже выражение, а вот:

def hello(name)
  "Hello #{name}!"
end
Уже является чем-то более сложным, чем выражение — фрагментом кода, который, однако состоит из выражений.

Строка кода — это совсем не то же самое, что строка текста, хотя бы потому, что одна строка в вашем редакторе кода может содержать несколько строк программного кода. Строка кода — это, если так можно выразиться, единица смысла или единица логики. Строка кода это скорее не элемент языка, а величина с помощью которой измеряется размер кода. Фрагмент кода:

def hello(name)
  "Hello #{name}!"
end
состоит из трех строк, которые совпадают с текстовыми строками, однако мы можем объединить эти три строки кода в одну физическую строку путем разделения их символом точки с запятой:

def hello(name);"Hello #{name}!";end
Я настоятельно не рекомендую вам писать код так, как показано выше, так как код написанный в такой способ теряет свою читабельность, то есть вернувшись к его разработке, скажем на следущий день, вам будет сложнее прочитать код и понять, что же вы вчера натворили.

Так как Ruby является объектно-ориентированным языком программирования, то и код написанный на Ruby состоит из объектов. Объект — это программная модель реального мира, его проицирование в код. Кошка, которая в данный момент трется об вашу ногу, или собака, которое хочет сделать с вашей ногой что-то другое являются объектами реального мира, как и вы сами. Для того, чтобы поместить объекты реального мира в код и необходим ООП — парадигма программирования. В Ruby абсолютно все является объектом, даже самые простые литералы:

5.class #=> Fixnum

4.5.class #=> Float

999999999999.class #=> Bignum

"hello world".class #=> String
Метод #class возвращает константу — имя класса, которому принадлежит объект. Из примеров выше, что литералы могут принадлежать различным классам, которые реализуют объекты типов данных: целое число (Fixnum или Bignum в зависимости от размера числа), число с плавающей точкой, оно же дробное число (Float), строка (String).

Литерал — это неизменяемое значение. Вы можете прибавить к строке символ, но это не будет объединение литералом или изменение уже имеющегося — это будет новый литерал. Представьте, что вы литерал нормального, здорового, адекватного человека, который хочет программировать на Ruby, теперь представьте, что вы случайно увидили тв-шоу Дом-2, теперь вы уже стали совсем другим человеком, вы не изменились, ваш мозг просто был отформатирован психологической травмой и вы теперь совсем другой человек. Надеюсь, этот пример дал вам представление того, что такое литерал.

Тип данных — это тип литерала. Типы данных введены для того, чтобы программа понимала с чем она имеет дело: числом, строкой или какой-либо структурой или коллекцией. Это необходимо потому, что компьютеры хранят всю информацию в бинарном виде и одну и ту же последовательность бит можно прочитать по разному. Тип данных определяет то, какие операции доступны над литератом, как его хранить и так далее. В Ruby тип данных приобрел несколько более широкое значение, тип данных в Ruby соответствует определенному классу. 5 имеет тип Fixnum, потому, что объект представляющий число 5 является экземпляром класса Fixnum, а строка «hello world!» имеет тип String, потому что является экземпляром класса String.

Запомните! В Ruby тип == класс. Литерал и любое другое значение == объект.

Переменные. Как и большинство языков программирования Ruby имеет такую штуку, как переменные. Переменные — это ссылки, которые позволяют легко и удобно получать доступ к определенным данным (определенному объекту). Принимайте переменную просто как удобное, кототкое имя какой-либо информации хранимой в оперативной памяти компьютера. В Ruby переменные создаются очень просто и могут легко менять тип данных. Обращаясь к переменной, вы обращаетесь, на самом деле, в объекту, на который она ссылается. Есть имя Владимир, и есть я — реальный, живой человек. Если вы, вдруг, увидите меня где-нибудь и захотите окликнуть, чтобы обратить мое внимание, то вы крикните «Воооова!!!» и это будет означать, что вы обращаетесь ко мне, а не к моему имени. Так же дела обстоят и с переменными, однако, для простоты выражения своих мыслей, принято говорить объект user, в то время, когда user является просто ссылкой на некий объект. В Ruby переменнуе создаются очень просто, достаточно подобрать подходящее имя и указать объект, на который следует ссылаться, говорят: присвоить переменное значение:

number = 5
user = User.new("Vladimir")
hello_string = "Hello #{@user.name}!"
Все три строки кода приведенные выше являются объявлениями переменных, как вы уже догадались, переменная считается объявленной тогда, когда ей присваиивается значение (указывается объект, на который она должна ссылаться). Переменная number будет ссылаться на 5, а перемення user на экземпляр класса User, переменная hello_string будет ссылаться на строку «Hello Vladimir!», говорят: переменная number хранит число, переменная hello_string хранит строку и так далее.

Блоки кода. Программа на Ruby также обладает такими конструктивными элементами, как блоки кода. Блок кода — это фрагмент кода, который заключен между фигурными скобками или ключевыми словами do и end и не является объектом, как и методы в Ruby. Одной из основных задач возложеных на блоки кода в Ruby является передача их в качестве аргумента фрагмента кода, который вызывается при помощи ключевого слова yield:

def execute_code_block()
  yield
end

execute_code_block {puts "Hello from method context!"}  #=> Hello from method context!
Второй задачей возложеной на блоки кода является создание лямбда-функций и процедур:

a = lambda{puts "hello!"} #=> #<Proc:0x8dd176c@(irb):25 (lambda)>
a.call #=> hello!

b = proc{|msg| puts msg} #=> #<Proc:0x8dc9008@(irb):28>
b.call("hello!") #=>hello!
Ruby код, как и любой другой программный код нуждается в комментариях. Комментарии — это записи в коде, который игнорируются интерпретатором и используются, чаще всего, для описания того, что код или определенный фрагмент кода делает. Комментирование кода — является очень привычкой, которая позволяет другим людям разобраться в вашем коде, да и вам легко вспомнить, что же там твориться. Для того, чтобы строка стала комментарием необходимо в начале строки поставить символ «шарп» -  #:

#this is the comment
puts("and this is the code")
Для того, чтобы создавать многострочные комментарии следует использовать специальные ключевые слова =begin и =end, которые делаю все, что содержится между ними комментарием:

=begin
I am
the multiline
comment
=end

Чтобы выполнять реальные действия Ruby код обладает методами. Метод — это единица функциональности. Методы объявляются очень просто, при помощи ключевого слова def (сокр. от define — объявление):

def my_first_method
  puts "my first method"
end
Для вызова метода достаточно просто обратиться к нему по имени:

my_first_method #=> my first method
Объекты  и классы. Поскольку Ruby объектно-ориентированный язык программирования, мы не можем обойти стороной объекты и классы. Класс — это описание объекта, а объект — модель чего-то из реального мира. Создание класса — очень простой процесс, который выполняется при помощи ключевого слова class:

class User
  def name
    puts "Vladimir"
  end
end
После ключевого слова class должно следовать имя класса, которое должно начинаться с заглавной буквы и является константой. Кстати, константа — это ссылка на объект, которая после объявление не может ссылаться на другой объект, говорят константа является неизменной. Далее следует тело класса состоящее из объявления методов и переменных, вызовом методов и так далее.

Объект, он же экземпляр класса создается из класса явно:

obj = User.new
obj.name #=> Vladimir
obj.class #=> User
Или неявно:

p = proc{|a| puts a}
p.class #=> Proc

5.class #=> Fixnum
Структуры управления ходом выполнения программы — ословные операторы if-elsif-else, unless и case-when-default:

Выражение if — elsif — else используется для выполнения определенных фрагментов кода если определенное условие верно. Самый простое if условие имеет следущий вид:

if 2 > 1
  puts "Hello!"
end

# Hello!
Код puts «Hello!» выполнился потому, что условие выполнение переданное в if возвратило true:

2 > 1 #=> true
Это, кстати, одна из особенностей Ruby — все в Ruby возвращает определенное значение, даже если такое значение явно не определено.

Выражение unless является обратным по отношению к выражению if и выполняет код, только если переданное ему условие возвращает false:

unless 5 < 2
  puts "Bye!"
end

#=> Bye!
Выражение case используется для выполнения определенных действий в зависимости от значения переданной в него переменной:

a = 2
case a
  when 1 then puts "a = #{a}"
  when 2 then puts "a > 1"
  else
    puts "hello!"
end

#=> a > 1
Циклы — это выражения Ruby, которые принимают блок кода и условие и выполняют блок кода до тех пор, пока переданное условие верно, то есть true:

i = 1
s = ""
while i < 10
  s += i.to_s
  i += 1
end

puts x #=> 123456789
Операторы. Язык Ruby также имеет приличный набор операторов, при этом многие «операторы», на самом деле таковыми не являются, поскольку являются методами, которые можно переопределить. Воспринимайте операторы как методы, которы нельза переопределить:

5 + 2 #=> 7
5.+ 2 #=> 7

class Fixnum
  def +(num)
    self**num
  end
end

5 + 2 #=> 25
+ не является оператором, поскольку его можно переопределить.

true and puts ("hello!")

true.and puts "hello" #=> NoMethodError: undefined method `and' for true:TrueClass
and является оператором.

Еще одним важным отличием операторов от методов является то, что у уператоров есть приоритет выполнения, а методы такого приоритета не имеют и выполняются по порядку следования:

1 + 2 * 4 #=> 9

class Fixnum
  def plus(n)
    self + n
  end

  def mult(n)
    self * n
  end
end

1.plus(2).mult(4) #=> 12
Как видите, методы + и * ведут себя двуяко, с одной стороны они позволяют себе переопределить, то есть проявляются себя как методы, с другой стороны, они имеют порядок выполнения чем проявляют себя как операторы. Это очень интересная особенность, о которой вам следует знать.

Некоторые особенности Ruby

- Практически все в Ruby является объектом! Даже классы являются специфичными объектами, и примитивные типы true, false и nil. Объектами не являются только блоки кода, методы и другие выражения языка (переменные, управляющие структуры, циклы и так далее).

- Все в Ruby возвращает значение, даже если возвращаемое значение явно не определено. Если значение явно не определено, то возвращается результат выполнение последнец строки метода, объкта и так далее. Если не имеет смысла возвращение какого-либо значения, то возвращается nil, возврат значения nil указывается явно.

На этом глава подходит к концу. В этой главе вы узнали достаточно многое, однако все, о чем вы узнали было изложено достаточно сжато и сухо, мы не рассмотрели очень и очень многого, мы не рассмотрели подробно элементы программы и основные типы данных в Ruby, но не беспокойтесь, каждому аспекту языка будет посвящена отдельная большая глава.
=end