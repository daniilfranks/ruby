class Item
	@@discount = 0.05

	def initialize(name, options={})
		@real_price = options[:price]
		@name = name
		#@price = price
		#@weight = weight
	end

	attr_reader :real_price, :name   #создает геттер
	attr_writer :price  #создает сеттер
	#attr_accessor :price, :weight, :name #создает геттер и сеттер

	def info
		#[price, weight, name]
		yield(price)
		yield(name)
	end

	def self.discount
		if Time.now.month == 9
			return @@discount + 0.1
		else
			return @@discount
		end
	end

	def price
		(@real_price - @real_price*self.class.discount) + tax if @real_price
	end

	def to_s
		"#{self.name}:#{self.price}:#{self.weight}"
	end

	private
		def tax
			type_tax = if self.class == VirtualItem
				1
			else
				2
			end
			cost_tax = if @real_price > 5
				@real_price*0.2
			else
				@real_price*0.1
			end
			cost_tax + type_tax
		end

=begin
	def price #создает геттер
		@price
	end

	def price=(price_value) #создает сеттер
		@price = price_value
	end
=end
end

=begin
item1 = Item.new
item1.price = 10
puts item1.price
item1.price = 20
puts item1.price
item1.weight = 300
puts item1.weight
=end

=begin
item1 = Item.new({:price => 10, :weight => 300})
puts item1.price
puts item1.weight

item2 = Item.new({:price => 30, :weight => 800})
puts item2.price
puts item2.weight

item3 = Item.new({})
puts item3.price
puts item3.weight
=end