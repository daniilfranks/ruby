=begin 
Ruby обладет очень мощным API для работы с файловой системой, которое позволяет производить очень сложные операции с использованием минимального количества кода, однако множество методов и классов с похожими именами может несколько запутать новичка.

Класс File

Класс File является встроенным в язык классом (поэтому вам не нужно подключать его в файл с вашим кодом), предоставляет методы для самых популярных манипуляций с файлами. Как и многие другие IO-штуки в Ruby, File является подклассом (дочерним классом) IO, в который подмешивается модуль Enumerable. Давайте пробежимся по основам!


Чтение из файла

Простейший способ получить доступ к файлу это вызов метода File.new с корректным путем файла в качестве параметра. Вы также после получения доступа к файлу можете получить его содержимое в виде строки просто воспользовавшись методом #read:

f = File.new("lib/file.rb")
content = f.read
f.close
Этого достаточно чтобы удовлетворить желания пользователей, однако часто необходим больший контроль. Вы можете читать файл строка за строкой при помощи методов #readline или #gets. Разница заключается в том, что File.readline выбрасывает исключительную ситуацию при завершении файла, в то время как #gets просто возвращает nil.

f = File.new("lib/file.rb")
while line = f.gets
  puts line
end
f.close
Вы также можете производить чтение файла посимвольно при помощи метода #readchar, или побайтно используя метод #readbyte. оба имеют эквивалентные get* методы с особенностями описанными выше. Стоит помнить, что количество байтов в файле зависит еще и от кодиировки текста.

Так как File относится к исчислимым значениям (Enumerable), то вы можете использовать методы #each или #each_line для обхода всего содержимого файла и передачи его строк в блок кода.

f = File.new("lib/file.rb")
f.each do |line|
  #делаем что-то со строкой
end
f.close
Вы можете получить еще больше точность перемещая внутреннюю метку(указатель) файла используя более низкоуровневые методы типа того же #seek.

Запись в файл

Чтобы иметь возможность записи в файл, вы должны сперва открыть его в режиме записи или дописывания (read- и append-mode). В режиме записи, при обращении к несуществующему файлу, файл будет создан, иначе, существующий файл будет полностью переписан. Режим записии указывается при помощи значения «w», которое передается в качестве второго аргумента в метод File.open. Режиим дописывания в файл также создаст файл при обращении к несуществующему файлу, иначе допишет новые данные в конец содержиимого файла. Режим дописывание указывается параметром «a».

Методы, которые используются для записи в файл это #puts который добавляет новую строку в файл и #print, который не добавляет новую строку. Вы также можете использовать метод #write, который возвращет количество байтов записаных в файл.

f = File.new('lib/file.rb', 'w')
f.puts("a new line will be appended")
f.print("no new line")
f.print(" at all")
puts f.read
>> "a new line will be appended\nno new line at all"
f.close
Использование блоков

Когда вы используете метод File.new, вы должны закрыть вручную открытий файл при помощи метода #close, что несколько неудобно и является причиной ошибок. Гораздо удобнее работать с методом File.open при передаче файла в блок кода, который затем закроет файл самостоятельно после окончания работы с ним. Метод open предоставляет те же режимы доступа к файлу, что и метод .new. Если вы не предусматриваете использование блоков кода, то File.open идентичен File.new.

File.open("lib/file.rb") do |f|
  f.each do
    #делаем что-то
  end
end
Исчисляемость файлов

File является исчисляемым (Enumerable), что дает ему множество приятных возможностей. Это несколько непривычно думать о файлах как о массивах строк, однако вы очень быстро привыкните и начнете использовать это. Ниже показаны некоторые интересные примеры:

#подсчет закоментированных строк
File.open("lib/file.rb").count{ |line| line.starts_with?("#") }

#получение всех строк с include в массиве
File.open("lib/file.rb").grep(/^include/)

#подсчет слов в каждой строке
File.open("lib/file.rb").inject(0) do |total, line|
  total += line.split.size
end
=end