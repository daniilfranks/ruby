class Car
	attr_accessor :make, :year, :color
	attr_reader :wheels

	def initialize(options = {})
		@make   = options[:make]  || 'Bmw'
		@year   = options[:year]  || '2017'
		@color  = options[:color] || 'black'
		@wheels = 4
	end

	def self.colors
		['blue', 'black', 'red', 'green']
	end

	def full_name
		"#{@year} #{@make} #{@color}"
	end
end
