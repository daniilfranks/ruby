h = Hash.new
h = {}
h = {a: 1, b: 2, c: 3}
p h[:b]
h.clear
p h.empty?

h = {a: 1, b: 2, c: 3, c: 4}
p h.to_a

p h.delete(:c)
p h

h = {a: 1, b: 2, c: 3, d: 4}
h.delete_if {|key,value| value < 2}
p h

h.each { |key,value| puts "#{key} #{value}"}
h.each_key { |key| puts "#{key}" }
h.each_value { |value| puts "#{value}" }
h[:e] = 5
p h
p h.length
p h.select{|k,v| v > 3}