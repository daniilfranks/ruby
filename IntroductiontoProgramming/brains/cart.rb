class Cart
	include ItemContainer
	#include ItemContainer::Manager

	attr_reader :items

	def initialize owner
		@items = Array.new
		@owner = owner
	end

	def save_to_file
		File.open("#{@owner}_cart.txt", "w") do |f|
			@items.each { |i| f.puts "#{i.name}:#{i.price}:#{i.weight}" }
		end
	end

	def read_from_file
		return unless File.exists?("#{@owner}_cart.txt")
		items_fields = File.readlines("#{@owner}_cart.txt")
		items_fields.map! {|i| i.chomp }
		items_fields.map! {|i| i.split(":")}
		items_fields.each {|i| @items << RealItem.new(name: i[0], price: i[1].to_i, weight: i[2].to_i) }
		@items.uniq!
	end
end