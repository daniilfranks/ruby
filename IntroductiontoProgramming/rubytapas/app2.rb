module Logged
	def logged_send(name, *args, &block)
		puts "Sending #{name} #{args.map(&:inspect).join(', ')}"
		send(name, *args, &block)
	end
end

class Greeter
	include Logged

	def hello(subject)
		puts "Hello, #{subject}"
	end
end

Greeter.new.logged_send(:hello, "Jo Asakura")



class TagList < Array 
	def <<(tag)
		tag.to_s.strip.split.each do |t|
			super(t)
		end
		self
	end

	def to_s
		join(" ")
	end
end

tags = TagList.new
tags << "foo" << "bar" << "baz buz"
puts tags.to_s


tl1 = TagList.new(%w[apple banana])
tl2 = TagList.new(%w[peach pear])
tl3 = tl1 + tl2
puts tl3.to_s
puts tl3.class