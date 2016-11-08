require 'set'
a = [:first, :second, :third, :fourth]
s = Set.new(a)
p s.to_a

x,y,z = s
p x
p y
p z

x,y,z = *s
p x
p y
p z

h = {
	:orange => :juice,
	:apple  => :cider,
	:lemon  => :lemonade
}

h.each do |arg|
	puts arg.inspect
end

h.each do |*arg|
	puts arg.inspect
end


def yield_pair
	yield([:foo,:bar])
end

yield_pair do |*pair|
	puts pair.inspect
end