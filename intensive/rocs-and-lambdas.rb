hello = lambda do 
	word = "Hello!"
	puts word
end

p hello.class
hello.call

add_35 = lambda { puts 35 }
add_35.call

add_94 = -> { puts 94 }
add_94.call


hi_proc = proc do
	hi = "Hi proc!"
	puts hi
end

p hi_proc.class
hi_proc.call


smile = lambda do |left = '*', right = '*'|
	puts "(#{left}.#{right})"
end

smile = lambda { |left = '*', right = '*'| puts "(#{left}.#{right})" }

smile.call
smile.call('-', '-')

smile.()
smile.('+', '+')


link_to = lambda { |href, text| puts "<a href='#{href}'>#{text}</a>" }

link_to.call 'blog.ru', 'My blog'
#link_to.call 'blog.ru'
#wrong number of arguments (given 1, expected 2) (ArgumentError)

#link_to.call 'blog.ru', 'My blog', ''
#wrong number of arguments (given 3, expected 2) (ArgumentError)

link_to = proc { |href, text| puts "<a href='#{href}'>#{text}</a>" }

link_to.call 'news.ru', 'My news'

link_to.call 'news.ru'

link_to.call 'news.ru', 'My news', ''



def start_game(money, options_type)
	options = case options_type
	when 1
		lambda do |money|
			return "Money is tight!" if money < 50
			"=Welcome="
		end
	when 2
		proc do |money|
			return "Money is tight!" if money < 50
			"=Welcome="
		end
	end

	puts options.call(money)
end

start_game 50, 1
start_game 5, 1

start_game 50, 2
start_game 5, 2

# & - унарный амперсанд

def pizza_each(type, &block)
	ingredients = case type
	when "Margarita"
		%w(tomato basil cheese)
	when "Marinada"
		%w(tomato garlic oregano)
	end
	ingredients.each &block
end

pizza_each("Margarita"){ |i| p i }


tell_about_pizza = lambda { |i| p i }
pizza_each "Marinada", &tell_about_pizza


class Cat
	def initialize
		@cat = case rand(3)
			when 0 then "Cat 1"
			when 1 then "Cat 2"
			when 2 then "Cat 3"
		end
	end

	def say_hello_cat
		puts @cat
	end
end

cat = Cat.new
cat.say_hello_cat