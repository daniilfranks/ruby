=begin 
В Ruby имеется специальный, предопределенный тип Struct, который позволяет создавать экземпляры Struct (структуры), являющиеся специфичными классами, объекты которых напоминают хэши, с тем лишь отличием, что количество ключей ограничено и имеются методы аксессоры для доступа к хранимым в них свойствам. Структура является специфичным классом, специфика которого заключена в том, что каждая структура наследуется от класса Struct. Примеры структур:

Класс:

сlass Student
  def initialize(name, last_name, course)
    @name = name
    @last_name = last_name
    @course = course
  end

  attr_accessor :name, :last_name, :course
end
… можно легко заменить следущим объектом типа Struct:

student = Struct.new('Student', :name, :last_name, :course)

Пример использования:

st1 = student.new('Vladimir', 'Melnik', 4)

st1.name # "Vladimir"
st1.course # 4
st1.course = 5
st1.course # 5

st2 = Struct::Student.new('Jack', 'Black', 5)
st2.name # "Jack"
st2.course # 5
Подтверждение того, что экземпляр Struct (структура) является классом, который наследуется от Struct:

student #=> Struct::Student
student.class #=> Class
student.superclass #=> Struct
То, что экземпляры Struct являются полноценными классами (наследуются от базового класса Class) дает вам возможность работать с ними аналогичным образом, например наследоваться от них другим классам:

class StudentClass < Struct::Student #or < student, or < Struct.new(:name, :last_name, :course)
  def initialize(name, last_name, course, age)
    @age = age
    self.name = name
    self.last_name = last_name
    self.course = course
end

attr_accessor :age
end

st3 = StudentClass.new('Henry', 'Ford', 3, 23)

st3.age #=> 23
st3.name #=> "Henry"
st3.last_name #=> "Ford"
К счастью, или, к сожалению, структуры используются крайне редко и многие Ruby программисты зная об их существовании игнорируют их. Виной всему — незнание того, когда их следует использовать и возможность неплохо обходиться без них.

В структурах, как и в полноценных классах доступно объявление методов, что позволяет расширить имеющиеся унаследованные и подмешанные методы и методы аксессоры собственными, определенными в передаваемом при создании структуры блоке кода, пример:

Struct.new('Student', :name, :last_name, :course) do
  def hello
    puts "Hello #{self.name}!"
  end
end

student = Struct::Student.new('Vladimir', 'Melnik', 4)
student.name #=> "Vladimir"
student.hello # Hello Vladimir!
Важно знать: структуры следует использовать если вам заранее известны все возможные ключи, в этом случае структурами следует заменять хэши. Кроме того, экземпляры Struct полезны еще и тем, что возвращают ошибку при обращении к несуществующим свойствам (ключам). Используйте Struct также в вместо традиционных классов, на объекты которых возлагается лишь роль хранения свойств.

Сравнение структур — экземпляров Struct

student = Struct.new('Student', :name, :last_name, :course) do
  def hello
    puts "Hello #{self.name}!"
  end
end

st1 = student.new('Vladimir', 'Melnik', 4)
st2 = student.new('Benny', 'Hill', 5)
st3 = student.new('Benny', 'Hill', 5)
st4 = student.new('Benny', 'Hill', 4)

st1 == st2   #=> false
st3 == st2   #=> true
st4 == st3   #=> false
st2.equal? st3 #=> false
Как видите, каждый экземпляр структуры представлен отдельным объектом. Два экземпляра одной структуры будут эквивалентными только если все их свойства эквивалентны.

Структуры как коллекции

Вы можете легко получить список свойств хранимых в структуре при помощи методов #size и #length, которые являются синонимами, пример:

student = Struct.new('Student', :full_name, :course)
name = Struct.new(:name, :f_name, :l_name)

st1 = student.new(name.new('Vladimir', 'Vladimirovich', 'Melnik'), 4)
st2 = student.new(name.new('Benny','Bennovich', 'Hill'), 5)

st1.size # 2
st2.length #2
st2.inspect #=> "#<struct Struct::Student full_name=#<struct name=\"Benny\", f_name=\"Bennovich\", l_name=\"Hill\">, course=5>"

st2.full_name.size #=> 3
Методы #members и #values (синоним #to_a) используются соответственно для получения массивов имен свойств (ключей) и значений хранимых в структуре, примеры:

st2.members # [:full_name, :course]
st2.values # [#<struct name="Benny", f_name="Bennovich", l_name="Hill">, 5]
Для обращения к свойствам не по ключу, а по индексу (целочисленному ключу) следует использовать метод #values_at,  который доступен благодаря тому, что в структурах пары «ключь — значение» упорядочены, пример использования:

p st2.values_at(0) #=> [#<struct name="Benny", f_name="Bennovich", l_name="Hill">]
st2.values_at(0,1) #=> [#<struct name="Benny", f_name="Bennovich", l_name="Hill">, 5]
В качестве аргументов для #values_at можно использовать целое число, набор целых чисел или диапазон.

Для работы со структурами также доступны итераторы #each, #each_pair и #select. Итератор #each просто проходит по массиву значений свойств и выполняет с каждым значением определенное действие. Метод #each_pair позволяет происзводить действие не только над значением свойства, но и над самим свойством (ключем). Итератор #select производит выборку значений по переданному в блоке условию и возвращает массив этих значений. Примеры использования итераторов:

#пример использования #each
student = Struct.new('Student', :full_name, :course)
name = Struct.new(:name, :f_name, :l_name)

st1 = student.new(name.new('Vladimir', 'Vladimirovich', 'Melnik'), 4)
st2 = student.new(name.new('Benny','Bennovich', 'Hill'), 5)

st1.each{|value| puts defined?(value.to_a) ? value.to_a : value}
#Vladimir
#Vladimirovich
#Melnik
#4

#пример использование #each_pair
def show_me_your_struct(struct)
  struct.each_pair do |property, value|
    if defined?(value.to_a)
      show_me_your_struct(value)
    else
      puts "#{property} => #{value}"
    end
  end
end

show_me_your_struct(st1)
#name => Vladimir
#f_name => Vladimirovich
#l_name => Melnik
#course => 4


#пример использования #select
st1.select{|v| v.instance_of?(Fixnum)} #=> [4]
Аксессоры как у хэшей
Для объектов структур предопределены методы — аксессоры такие же как и для хэшей [] и []=, которые позволяют обратится к значению по имени его свойства переданного в виде строки или символа, либо использовать индексы свойств, примеры:

n1 = name.new('Benny','Bennovich', 'Hill')

n1[:name] #=> "Benny"
n1["l_name"] #=> "Hill"
n1[:name] = 'Benn'
n1["name"] #=> "Benn"
n1[0] #=> "Benn"
n1[2] #=> "Hill"
Упражнение: необходимо написать метод, который бы преобразовывал структуры в хэш с аналогичной структурой пар «ключь-значение». Свои решения пишите в комментариях, лучшее решение будет представлено в конце статьи, а победителю респект и уважуха ;-)
=end