class Cart
	include ItemContainer
	#include ItemContainer::Manager
	class ItemNotSupported < StandardError; end

	attr_reader :items

	UNSUPPORTED_ITEMS = [AntiqueItem, VirtualItem]

	def initialize owner
		@items = Array.new
		@owner = owner
	end

	def save_to_file
		File.open("#{@owner}_cart.txt", "w") do |f|
			@items.each do |i|
				raise ItemNotSupported if UNSUPPORTED_ITEMS.include?(i.class)
				f.puts i
			end
		end
	end

	def read_from_file
		begin
			#return unless File.exists?("#{@owner}_cart.txt")
			File.readlines("#{@owner}_cart.txt").each {|i| @items << i.to_real_item }
			@items.uniq!
		rescue Errno::ENOENT
			File.open("#{@owner}_cart.txt", "w") {}
			puts "file #{@owner}_cart.txt created"
		end
	end
end