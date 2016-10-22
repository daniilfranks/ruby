=begin
Концепции Proc (сокр. От Procedure — процедура) и Lambda (Лямбда-функция) в Ruby имеют очень тонкие различия, которые новичкам могут показаться незначительными, а могут и вообще не показаться=) Этот пост — попытка продемонстрировать и объяснить эти их особенности.

Proc и Lambda
Для началадавайте разберемся, зачем нам необходимы Proc и Lambda. Для того, чтобы дать ответ на этот вопрос нам необходимо понять, что такое блоки в Ruby.

Понимаем, что такое блоки
Блок — это просто кусок кода, который, обычно, присоединен к методу, процедуре или Lambda-функции. Важно запомнить, что блок кода — это не объект, это любой код, определенный внутри фигурных скобок { и }, или внутри контейнера do-end.

Код внутри блока это всего-лишь логика, которая еще не обернута в объект. Когда этот блок передается методу и в этом методе используется выражение yield, для использования блока, тогда Ruby обернет блок в специальный тип объекта. Этим типом объекта является объект Proc. Как только блок становится объектом Proc, Ruby может использовать его и код содержащийся в блоке оживает.

Таким образом объект Proc необходим для работы с блоками кода. Следующий вопрос: Зачем нам необходима lambda?

Lambda — это разновидность объекта Proc, лямбда почти полностью иддентична Proc если не обращать внимание на две ключевые особенности. Нижеприведенный пример показывает Proc и лямбду полученные из одного и того же суперкласса — Proc.

def what_are_lambdas_and_procs
  puts "--- #{__method__} ---"
  lam = lambda { puts 'lam variable assigned a lambda' }
  lam.call
  puts "lam is a class of: #{lam.class.name}"
  puts "lam method count: #{lam.methods.size}"
  puts
  prc = Proc.new { puts 'prc variable assigned a Proc' }
  prc.call
  puts "prc is a class of: #{prc.class.name}"
  puts "prc method count: #{prc.methods.size}"
  ""
end
Этот код напечатает:

— what_are_lambdas_and_procs —
lam variable assigned a lambda
lam is a class of: Proc
lam method count: 55

prc variable assigned a Proc
prc is a class of: Proc
prc method count: 55

Так в чем же различия между Proc и lambda?

Таких отличий всего два:

1. Различие в том, как Proc / Lambda назначает аргументы

<p>2. Различие в том, что происходит, когда Proc / Lambda вызовы возвращают внутри вызываемого метода.</p>

Присвоение значений аргументам proc и lambda
Если лямбда вызывается с большим, или меньшим количеством аргументов, чем необходимо, тогда Ruby выдает ошибку ArgumentError.

Однако когда Proc вызывается с большим количеством аргументов, чем необходимо, никакой ошибки не возвращается и лишние аргументы просто отбрасываются. Когда процедура вызывается с меньшим количеством аргументов, то те параметры, которые не получили необходимых значений, приобретают значение nil.

Следующие два фрагмента кода демонстрируют вышеописанное различие в работе:

def lambda_args
  puts "--- #{__method__} ---"
  lam = lambda { |a, b| puts "lambda with 2 arguments a:#{a}, b:#{b}" }
  lam.call( "first", "second")
  puts "lambda called with three arguments..."
  begin
    lam.call("first", "second", "third")
  rescue
    puts "   ArgumentError: wrong number of arguments (3 for 2)"
  end
  puts "lambda called with no arguments..."
  begin
    lam.call()
  rescue
    puts "   ArgumentError: wrong number of arguments (0 for 2)"
  end
end

def proc_args
  puts "--- #{__method__} ---"
  prc = Proc.new { |a, b| puts "Proc with 2 arguments a:#{(a.nil?) ? "nil" : a }, b:#{(b.nil?) ? "nil" : b }" }
  prc.call( "first", "second")
  puts "Proc called with three arguments..."
  prc.call("first", "second", "third")
  puts "Proc called with no arguments..."
  prc.call()
end
Они намечатают следующий текст:

— lambda_args —
lambda with 2 arguments a:first, b:second
lambda called with three arguments…
ArgumentError: wrong number of arguments (3 for 2)
lambda called with no arguments…
ArgumentError: wrong number of arguments (0 for 2)

— proc_args —
Proc with 2 arguments a:first, b:second
Proc called with three arguments…
Proc with 2 arguments a:first, b:second
Proc called with no arguments…
Proc with 2 arguments a:nil, b:nil

Возврат значений из proc и lambda
Когда лямбда-функция возвращает значение и эта лямбда вызывается внутри метода, то метод будет просто продолжать свое выполнение после окончания работы лямбды, пока в конце-концов он сам не сам не вернет свое собственное значение.

Однако, когда Proc возвращает значение и эта процедура вызывается внутри метода, тогда выполнение этого метода будет остановлено. Это немного странное поведение и поэтому Proc следует использовать осторожно.

Два следующих примера демонстрируют это поведение:

def lam_return
  puts "--- #{__method__} ---"
  puts "simple function that calls a lambda and then returns it's own string."
  my_lam = lambda { return 'Lambda has returned' }
  my_lam.call
  return 'lam_return method string returned'
end

def proc_return
  puts "--- #{__method__} ---"
  puts "simple function that calls a Proc, \nBUT instead of returning it's own string returns the Proc's string."
  my_proc = Proc.new { return 'Proc string returned' }
  my_proc.call # this function returns and finishes here
  return 'proc_return method string returned' # the return is never called
end
Они напечатают следующее:

— lam_return —
simple function that calls a lambda and then returns it’s own string.
lam_return method string returned

— proc_return —
simple function that calls a Proc,
BUT instead of returning it’s own string returns the Proc’s string.
Proc string returned

Обход ограничений proc на возврат значений
Выше уже говорилось, что завершение работы Proc автоматически завершает работу метода его вызвавшего, однако существует простой способ обхода этой особенности. Для того, чтобы избавится от этой особенности, следует просто избавится от выражения return в Proc, таким образом Proc не будет завершать работу вызвавшего ее метода, но значение из Proc, тем не менее будет возвращено, поскольку в Ruby все имеет значение и если оно явно не возвращается через выражение return, то возвращается результат результат последней строки. Ниже приведен пример:

def proc_return_work_around
  puts "--- #{__method__} ---"
  puts "simple function that calls a Proc, \nhowever the method string still returns."
  my_proc = Proc.new { 'Proc string returned' }
  my_proc.call # this function returns and finishes here
  return "#{__method__} method string returned" # the return is never called
end
Этот код напечатает следующее:

— proc_return_work_around —
simple function that calls a Proc,
however the method string still returns.
proc_return_work_around method string returned

Заключение
Как вы заметили, существует только два маленьких отличия между процедурой и лямбда-функцией, но эти отличия имеют весьма интересное поведение. Поэтому следуя принципу «меньшей неожиданности» в Ruby, лучше использовать Lambda вместо процедур, если только использование процедур не является необходимым.
=end