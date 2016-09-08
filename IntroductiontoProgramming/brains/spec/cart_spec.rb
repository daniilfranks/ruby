#rspec spec/cart_spec.rb
require 'rspec'
require_relative "../item"
require_relative "../virtual_item"
require_relative "../antique_item"
require_relative "../item_container"
require_relative "../cart"

describe Cart do 
	it "add items" do 
		cart = Cart.new("den")
		item1 = Item.new("cat", price: 100)
		item2 = Item.new("dog", price: 100)
		cart.add_items(item1, item2)
		cart.items.should include(item1, item2)
	end
end
