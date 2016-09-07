class Order
	include ItemContainer
	#include ItemContainer::Manager
	#include ItemContainer::Info

	attr_reader :items

	def initialize
		@items = Array.new
	end

	def place
	end
end