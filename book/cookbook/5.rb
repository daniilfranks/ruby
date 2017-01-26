class Translate
	@@translation = { :en => 'Hi world', :rus => 'Привет мир'}

	def initialize(language = :en)
		@language = language
		#@translation = { :en => 'Hi world', :rus => 'Привет мир'}
	end

	def translate
		#@@translation[@language]
		@@translation[@language]
	end
end

p default = Translate.new
p default.translate
p Translate.new(:rus).translate

class Module
	def class_attr_reader(*symbols)
		symbols.each do |symbol|
			self.class.send(:define_method, symbol) do
				class_variable_get("@@#{symbol}")
			end
		end
	end

	def class_attr_writer(*symbols)
		symbols.each do |symbol|
			self.class.send(:define_method, "#{symbol}=") do
				class_variable_set("@@#{symbol}", value)
			end
		end
	end

	def class_attr_accessor(*symbols)
		class_attr_reader(*symbols)
		class_attr_writer(*symbols)
	end
end


class Fate
	NAMES = ['Leonard', 'Howard', 'Glen'].freeze
	@@number_instantiated = 0

	class_attr_reader :number_instantiated

	def initialize
		if @@number_instantiated >= NAMES.size
			raise ArgumentError, 'Three Fate!'
		end
		@name = NAMES[@@number_instantiated]
		@@number_instantiated += 1
		puts "I give you #{@name}"
	end
end

p Fate.number_instantiated
p Fate.new
p Fate.number_instantiated
p Fate.new
p Fate.number_instantiated
p glen = Fate.new
p Fate.number_instantiated
