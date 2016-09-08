#rspec spec
require 'rspec'
require_relative "../item"
require_relative "../virtual_item"

describe Item do
	before(:each) do 
		@item = Item.new("cat", price: 100)
	end

	#before(:all) do 
	#end	

	it "calculates price" do 
		@item.price.should == 107
	end

	it "return info object" do 
		@item.to_s.should == "cat:107.0"
	end
end