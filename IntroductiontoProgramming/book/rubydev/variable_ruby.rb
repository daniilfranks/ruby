=begin 
Честно говоря я не очень понимаю в чем возникает путаница с переменными в Ruby, однако мне уже не раз задавали вопросы типа: Что такое @-переменная? Что такое @@-переменная? А в чем их разница?

В этой статье я постараюсь рассказать обо всех типах переменных и константах языка Ruby, а на подобные вопросы буду давать ссылку на эту статью.

В Ruby существует 4 вида переменных и константы.

##Локальные переменные

product, users, file, user_rights — все это примеры имен локальных переменных. Локальные переменные замкнуты в той области видимости, где они объявлены: тело модуля, тело класса, тело метода, объект, блок кода. Снаружи той области где они объявлены эти переменные не видны, потому область объявления включая вложенные области является областью видимости локальных переменных. Пример:

def my_method
  message = "Bye!"
  lmbd = ->(message) { puts message }
  lmbd.call("Hello!")
  puts message
end

my_method
# Hello!
# Bye!
Как видите, в нашем методе имеется 2 переменных с именем message, первая создается в самом начале тела метода и хранит строку «Bye!», а вторая принадлежит лямбде и хранит переданное в вызов лямбды значение. Областью видимости первой является все тело метода, а областью видимости второй — объект типа Proc — лямбда. Именно по этой причине message не меняет свое значение при вызове лямбды, так как у лямбды создается своя собственная переменная с тем же именем.

##Переменные экземпляра

Следующий тип переменных — это переменные экземпляра класса или переменные объекта (экземпляр класса и объект — два названия одного и того же). Имена этих переменных начинаются со знака @, например:

@user, @articles, @attributes_hash, и т.д.

Областью видимости этих переменных является объект. Пример:

class User
  def initialize(login, password, email)
    @login    = login
    @password = password
    @email    = email
  end

  def user_data
    @user_data ||=
    {
      login: @login,
      password: @password,
      email: @email
    }
  end
end

user = User.new "admin", "qwerty", "admin@admin.com"
#=> #<User:0x98db5f4 @login="admin", @password="qwerty", @email="admin@admin.com">

user.user_data
#=> {:login=>"admin", :password=>"qwerty", :email=>"admin@admin.com"}
Не смотря на то, что переменные @login, @password и @email были объявлены внутри метода #initialize, одни доступны и в методе #user_data. Областью видимости переменных экземпляра класса является весь объект.

Список переменных объекта можно получить используя метод #instance_variables:

user.instance_variables
#=> [:@login, :@password, :@email, :@user_data]
Получить значение переменной экземпляра класса можно используя метод #instance_variable_get:

user.instance_variable_get :@email
#=> "admin@admin.com"
Объявить новую переменную экземпляра класса или переопределить существующую можно используя метод #instance_variable_set:

user.instance_variable_set :@email, "admin@rubydev.ru"
#=> "admin@rubydev.ru"
user.instance_variable_set :@name, «Vladimir»
#=> «Vladimir»

user.instance_variables
#=> [:@login, :@password, :@email, :@user_data, :@name]
Проверить объявлена ли определенная переменная экземпляра можно используя метод #instance_variable_defined?:

user.instance_variable_defined? :@name #=> true
user.instance_variable_defined? :@last_name #=> false
Стоит отметить, что классы будучи также объектами также имеют переменные экземпляра класса.

class User
  def initialize(login, password, email)
    @id       = User.increment_users_count
    @login    = login
    @password = password
    @email    = email
  end

  def user_data
    @user_data ||=
    {
      id: @id,
      login: @login,
      password: @password,
      email: @email
    }
  end

  def users_count
    self.class.instance_variable_get :@users_count
  end

  def self.users_count
    @users_count ||= 0
  end

  def self.users_count=(value)
    @users_count = value
  end

  def self.increment_users_count
    self.users_count += 1
  end

end

user = User.new "Vladimir", "123456", "admin@rubydev.ru"
#=> #<User:0x8a79830 @id=1, @login="Vladimir", @password="123456", @email="admin@rubydev.ru">

User.users_count #=> 1

user2 = User.new "Vitaly", "qwerty", "vitaly@rubydev.ru"
#=> #<User:0x8a5fe08 @id=2, @login="Vitaly", @password="qwerty", @email="vitaly@rubydev.ru">

User.users_count #=> 2

User.instance_variables #=> [:@users_count]
Переменные объекта самого класса недоступны в его экземплярах, точнее вы не можете обращаться к ним напрямую, но можете использовать методы #instance_variable_get или #instance_variable_set, например так:

def users_count
  self.class.instance_variable_get :@users_count
end
Объявив такой метод для экземпляра класса User, мы можем получать значение счетчика экземпляров следующим образом:

user.users_count #=> 2
##Переменные класса

Теперь рассмотрим переменные класса. Переменные класса — это переменные, имена которых начинаются с @@, например:

@@users, @@table_name, @@sql_adapter, @@very_very_long_class_variable_name

Переменные классов отличаются от переменных экземпляра класса тем, что будучи объявлены в любом месте, их областью видимости будет класс и все его экземпляры. То есть в отличие от переменных объекта самого класса, к переменным класса можно обратиться напрямую. Для того, чтобы продемонстрировать это я перепишу код класса User, что мы использовали ранее, с применением переменных класса.

class User
  @@users_count = 0

  def initialize(login, password, email)
    @id       = @@users_count += 1
    @login    = login
    @password = password
    @email    = email
  end

  def user_data
    @user_data ||=
    {
      id: @id,
      login: @login,
      password: @password,
      email: @email
    }
  end

  def users_count
    @@users_count
  end

  def self.users_count
    @@users_count
  end

end

user = User.new "Vladimir", "123456", "admin@rubydev.ru"
#=> #<User:0x91fc364 @id=1, @login="Vladimir", @password="123456", @email="admin@rubydev.ru">

User.users_count #=> 1
user.users_count #=> 1

User.class_variables #=> [:@@users_count]

User.class_variable_get :@@users_count #=> 1

User.class_variable_set :@@users_count, 100 #=> 100

User.users_count #=> 100
user.users_count #=> 100

User.class_variable_defined? :@@users_count #=> true
В общем работа с переменными класса очень похожа на работу с переменными экземпляра класса. Основная рекомендация к использованию переменных класса такая: Используйте переменные класса, если объекты нуждаются в данных из класса или для синхронизации между экземплярами класса. Примером обмена данными между объектами служит используемый нами в примерах счетчик экземпляров класса User.

##Глобальные переменные

Глобальные переменные — это переменные, имена которых начинаются с символа $, например:

$:, $LOAD_PATH, $binding и т.д.

Глобальные переменные так называются так, потому, что независимо от области в которой они объявлены, они видны везде.

Получить список глобальных переменных можно используя метод global_variables. Вызвав global_variables в IRB REPL я получил следующий результат:

global_variables
#=> [:$;, :$-F, :$@, :$!, :$SAFE, :$~, :$&, :$`, :$', :$+, :$=, :$KCODE, :$-K, :$,, :$/, :$-0, :$\, :$_, :$stdin, :$stdout, :$stderr, :$>, :$<, :$., :$FILENAME, :$-i, :$*, :$?, :$$, :$:, :$-I, :$LOAD_PATH, :$", :$LOADED_FEATURES, :$VERBOSE, :$-v, :$-w, :$-W, :$DEBUG, :$-d, :$0, :$PROGRAM_NAME, :$-p, :$-l, :$-a, :$binding, :$1, :$2, :$3, :$4, :$5, :$6, :$7, :$8, :$9]
Вам лучше избегать создания глобальных переменных и переопределения значения уже существующих. В Ruby глобальные переменные используются в служебных целях, все приведенные выше глобальные переменные являются предопределенными и хранят определенные данные важные для работы вашего приложения. С ними нужно работать осторожно. Список предопределенных глобальных переменных с описанием доступен здесь: http://ruby.runpaint.org/globals

##Теперь подошло время разобраться с константами.

Константы — это «переменные», чье значение не изменяется, а имя начинается с заглавной литеры, наприме:

User, UsersController, ProductsHelper и т.д.

Имена классов и модулей являются константами.

Несмотря на то, что в других языках переопределить значение константы нельзя, в Ruby это возможно, однако вы получете предупреждение.

MyConst = "rubydev.ru"

MyConst = ["Rubydev.ru"]
#(irb):77: warning: already initialized constant MyConst

MyConst #=> ["Rubydev.ru"]
Что еще можно сказать о константах? — Немного о метамагии! Немного метамагии работы с константами

Если вы совсем взрослы и даже умеете работать с Rails, то вы, должно быть, использовали код вроде такого:

belongs_to :author, class_name: "User"
Как же по строке «User» удается понять, что подразумевается использование класса User? Я не смотрел в исходники и потому не могу достоверно утверждать, но я подозреваю, что там используется следующий прием:

Kernel.const_get "User" #=> User
Таким простым образом мы «преобразуем» строку в константу, а посколько имена классов — константы, то в такой образ наше приложение способно понять, что мы хотим сделать.
=end