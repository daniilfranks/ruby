class TaxCalc
	def initialize(name, &block)
		@name, @block = name, block
	end

	def get_tax(amount)
		"#{@name} on #{amount} = #{ @block.call(amount) }"
	end
end

tc = TaxCalc.new("Sales tax") { |amt| amt * 0.075 }

p tc.get_tax(100)
p tc.get_tax(250)


class Customer
	attr_reader :name

	def initialize(name)
		@name    = name
		@rentals = []
	end

	def add_rental(arg)
		@rentals << arg
	end

	def del_rental(arg)
		@rentals.delete(arg)
	end
end

arg = Customer.new("First")
p arg.add_rental("den")
p arg.add_rental("bob")
p arg.add_rental("alex")
p arg.del_rental("bob")
p arg