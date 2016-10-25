arr = ["apple", "cake", "bake", "cookie", "bake", "car", "apple", "apple"]
hash = Hash.new(0)

arr.each { |value| hash[value] += 1 }
p hash


arr = ["cake", "bake", "cookie", "car", "apple"]
hash = Hash.new{ |h,k| h[k] = [] }

arr.each{ |value| hash[value.length] << value }
p hash

p "="*30


opts = Hash.new{ |k,v| k[v] = Hash.new(&opts.default_proc) }

opts['dev']['db']['host'] = 'localhost:3000'
opts['dev']['db']['user'] = 'user'
opts['dev']['db']['pass'] = '12345'

opts['test']['db']['host'] = 'localhost:3000' 
opts['test']['db']['user'] = 'test_user'
opts['test']['db']['pass'] = '54321'

p opts















=begin
В Ruby при объявлении хэша, в хэш можно передавать блок кода. Блок передаваемый хэшу вызывается каждый раз, когда вы обращаетесь к несуществующему ключу хэша. Блок передаваемый хэшу при его объявлении имеет следующий формат:

Hash.new{|hash, key| … }

hash — ссылка на самого себя (текущий объект hash), а параметр key — содержит ненайденный ключ. Со всем этим вы можете инициировать значения по умолчанию в хэше до того, как они станут доступными. Ниже представлены несколько интересных вещей, которые вы можете сделать при помощи блока кода, который передается в хэш при его объявлении.

По набору значений в массиве вы можете легко объединить значения в список:

groups = Hash.new{|h,k| h[k] = [] }
list   = ["cake", "bake", "cookie", "car", "apple"]

# группируем значения по длине строки
list.each{|v| groups[v.length] << v} groups #=> {4=>["cake", "bake"], 6=>["cookie"], 3=>["car"], 5=>["apple"]}
Мы также можем в очень элегантный способ произвести подсчет повторений элементов массива:

counts = Hash.new{|h,k| h[k] = 0 }
list   = ["cake", "cake", "cookie", "car", "cookie"]
# Предложение от Dan: строку: Hash.new{|h,k| h[k] = 0 }
# можно сократить до: Hash.new(0)

# подсчитываем число одинаковых значений
list.each{|v| counts[v] += 1 }
counts #=> {"cake"=>2, "cookie"=>2, "car"=>1}
Вы также можете построить древовидную структуру в которой хэши возвращают другие хэши:

tree_block = lambda{|h,k| h[k] = Hash.new(&tree_block) }
opts = Hash.new(&tree_block)
# предложение от pete: первые две строки
# можно заменить одной: opts = Hash.new {|h,k| h[k] = Hash.new(&opts.default_proc) }

opts['dev']['db']['host'] = "localhost:2828"
opts['dev']['db']['user'] = "me"
opts['dev']['db']['password'] = "secret"
opts['test']['db']['host'] = "localhost:2828"
opts['test']['db']['user'] = "test_user"
opts['test']['db']['password'] = "test_secret"

opts #=> {"dev"=>
        {"db"=>{"host"=>"localhost:2828", "user"=>"me", "password"=>"secret"}},
"test"=>
        {"db"=>{"host"=>"localhost:2828", "user"=>"test_user", "password"=>"test_secret"}}
}
Блок может быть также использован для создания кэша:

require 'net/http'
http = Hash.new{|h,k| h[k] = Net::HTTP.get_response(URI(k)).body }
http['http://www.google.com'] # делается запрос
http['http://www.google.com'] # возвращается помещенное в кэш значение
В Ruby 1.9 хэши имеют порядок следования элементов благодаря чему вы можете создавать хэш фиксированного размера и выбрасывать из него старые, ненужные значения:

http = Hash.new{|h,k|
h[k] = Net::HTTP.get_response(URI(k)).body
  if h.length > 3
    h.delete(h.keys.first)
  end
}
http['http://www.google.com']
http['http://www.yahoo.com']
http['http://www.bing.com']
http['http://www.reddit.com'] # this evicts http://www.google.com
http.keys #=> ["http://www.yahoo.com", "http://www.bing.com", "http://www.reddit.com"]
Теперь вы легко можете ограничивать количество элементов хранимых в хэше, например для оптимизации потребления оперативной памяти.

Еще одна интересная возможность хэшей — это вычисление рекурсивных функций:

factorial = Hash.new do |h,k|
  if k > 1
    h[k] = h[k-1] * k
  else
    h[k] = 1
  end
end
Код находящийся выше будет кэшировать каждый результат, таким образом, что если вы вычисляете факториал для массива чисел только один раз и значения факториалов для каждого числа будут храниться в парах число => факториал. Например factorial[] подсчитает значения факториала для 1, 2, 3, благодаря чему при вызове factorial[3] факториал для 3 не будет повторно вычисляться, мы получим уже готовое значение сохраненное в нашем хэше.

Предлагайте в коментариях свои варианты интересного и полезного использования блоков в хэшах. Например в блоге автора оригинального поста, комментатор pahanix предложит интересный способ объявления дат используя синтаксис хэша: Dec[31][2010]. Вот собственно код. который реализует это:

require ‘date’

FancyDate = Hash.new do |hash, month|
  Hash.new do |hash, day|
    Hash.new do |hash, year|
      Date.new(year, month, day)
    end
  end
end

Date::ABBR_MONTHNAMES[1..-1].each_with_index do |name,index|
  Object.const_set(name, FancyDate[index 1])
end
=end