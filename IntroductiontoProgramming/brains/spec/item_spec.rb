#rspec spec
require 'rspec'
require_relative "../item"
require_relative "../virtual_item"

describe Item do 
	it "calculates price" do 
		item = Item.new("cake", price: 200)
		item.real_price.should == 200
	end
end

