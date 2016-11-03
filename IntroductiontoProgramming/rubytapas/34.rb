require 'ostruct'

s = Struct.new(:foo, :bar).new(42, 23)
os = OpenStruct.new(foo: 42, bar: 23)

p s
p os


Beer = Struct.new(:brewery, :name, :abv, :ibu) do 
	def self.from_hash(attributes)
		instance = self.new
		attributes.each do |key, value|
			instance[key] = value
		end
		instance
	end

	def attributes
		result = {}
		members.each do |name|
			result[name] = self[name]
		end
		result
	end
end

hopback = Beer.from_hash(
	brewery: "Troegs",
	name: "Hobdback Ale",
	abv: 6.0,
	ibu: 55)

p hopback.attributes