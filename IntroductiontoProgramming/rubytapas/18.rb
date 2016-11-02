class TagList < Array
	def <<(tag)
		tag.to_s.strip.split.each do |t|
			super(t)
		end
		self
	end

	def to_s
		join(' ')
	end
end

tags = TagList.new
tags << "foo" << "bar" << "baz buz"
p tags.to_s
p tags.grep(/b/)


tl1 = TagList.new(%w[apple banana])
tl2 = TagList.new(%w[peach pear])
tl3 = tl1 + tl2
p tl3.to_s
p tl3.class