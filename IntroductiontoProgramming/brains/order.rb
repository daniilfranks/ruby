class Order
	include ItemContainer
	#include ItemContainer::Manager
	#include ItemContainer::Info

	attr_reader :items, :placed_at

	def initialize
		@items = Array.new
	end

	def place
		@placed_at = Time.now
	end
end