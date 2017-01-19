class Key
	attr_reader :id

	def initialize(key)
		@key = key
		the_split
	end

	def the_split
		raise "#{@key}" unless @key.split(':').size == 3
		@id = @key.split(':').last
	end

	def to_s
		@key
	end
end

p key = Key.new('1:5:9')
p key.to_s
p key.the_split

p key2 = Key.new('1:5:9:23')
p key2.to_s
p key2.the_split
