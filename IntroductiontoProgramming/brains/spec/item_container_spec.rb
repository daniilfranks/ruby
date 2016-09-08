#rspec spec
require 'rspec'
require_relative "../item"
require_relative "../virtual_item"
require_relative "../item_container"

class Itembox
	include ItemContainer

	def initialize
		@items = []
	end
end

describe ItemContainer do

	before(:each) do 
		@box = Itembox.new
		item1 = Item.new("cat", price: 100)
		item2 = Item.new("dog", price: 100)
	end

	it "add items" do 
		@box.add_item(@item1)
		@box.add_item(@item2)
		@box.items.should have(2).items
	end

	it "remove item" do 
		@box.add_item(@item1)
		@box.add_item(@item2)
		@box.remove_item.should be(@item2)
		@box.remove_item
		@box.items.should be_empty
	end

	if "rails error" do
		lambda {@box.add_item("something else")}
	end
end