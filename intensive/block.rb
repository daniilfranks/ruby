class Gladiator
	attr_accessor :name, :age, :rand

	def initialize(name, age, rand=0)
		@name, @age, @rand  = name, age, rand
	end

	def say_hello
		puts "Ave Cesar"
		yield if block_given?
		puts "Hello dead!"
	end

	def you_age
		yield(age) if block_given?
	end

	def rand
		if block_given?
			coin_flip = yield(rand)
			if coin_flip == 1
				puts "You win!"
			else
				puts "You lose!"
			end
		end
	end

	def to_s
		yield
	end
end

spartak = Gladiator.new("Spartak", 30)
spartak.say_hello
spartak.say_hello{ puts "===Hi block===" }
spartak.say_hello { puts "You name: #{spartak.name}" }
spartak.you_age
spartak.you_age{ puts "You age: #{spartak.age}" }
spartak.rand
spartak.rand{ rand(2) }
spartak.to_s{ puts "Name: #{spartak.name}, Age: #{spartak.age}" }

=begin 
Блок — это произвольный код, который можно передать любому методу 
в качестве неявного последнего аргумента. Следует понимать, что при этом 
блок является особой конструкцией языка и обособлен от списка явных 
аргументов метода, что означает следующее:
-методу можно передать только один блок;
-он всегда идет в самом конце и вынесен за скобки с аргументами 
(если они есть);
-его можно задать при вызове любого метода, независимо от того, 
указаны в определении метода аргументы или нет.
Код может находиться внутри фигурных скобок { } или ключевых слов do end. 
Что именно использовать — решать вам, потому что обе конструкции описывают 
совершенно одинаковые по свойствам блоки. Обычно в фигурные скобки 
заключают код, состоящий из одной строки, при этом метод и его блок 
записывают на одной строке. Если код блока слишком длинный или объемный, 
вместо скобок на строке с вызовом метода оставляют do, а сам код пишут с 
новой строки с отступом и в конце «закрывают» его end'ом.

yield — это часть синтаксиса языка, как и объявление блока 
(поэтому ее нельзя переопределить). Когда в теле метода мы вызываем yield,
то подразумеваем следующее: «отдай управление блоку, а когда тот закончит,
верни управление этому методу».
=end

class User
	attr_accessor :name, :age, :rank

	def initialize
		yield(self)
	end
end

den = User.new do |param|
	param.name = "Den"
	param.age  = 25
end

p den