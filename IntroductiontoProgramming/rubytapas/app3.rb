class TagList
	include Enumerable

	def initialize(*args)
		@list = Array.new(*args)
	end

	def <<(tag)
		tag.to_s.strip.split.each do |t|
			list << t
		end
		self
	end

	def to_s
		list.join(" ")
	end

	def +(other)
		TagList.new(list + other.list)
	end

	def each(*args, &block)
		list.each(*args, &block)
	end

	protected

	attr_reader :list
end

tags = TagList.new
tags << "foo" << "bar" << "baz buz"
puts tags.to_s


tl1 = TagList.new(%w[apple banana])
tl2 = TagList.new(%w[peach pear])
tl3 = tl1 + tl2
puts tl3.to_s
puts tl3.class

p tl3.grep(/p/)
p tl3.map(&:reverse)
p tl3.group_by(&:size)