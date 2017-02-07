class Greeting
	NUMBER_GREETING = 0.0
	def initialize(text)
		@text = text
	end

	def welcome
		@text
	end
end

start = Greeting.new('Text')
p start
p start.welcome
p start.class
p start.class.instance_methods
p start.instance_variables
p start.class.superclass
p Greeting::NUMBER_GREETING

class NewGreeting; end
p obj1 = NewGreeting.new
p obj1.instance_variable_set(:@number, 100)
p obj1.instance_variable_get(:@number)




