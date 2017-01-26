string = 'My first string'
p string.length
p string.count('i')
p string.slice(3..7)
p string.empty?
p string.include?('string')
p string[1..5]

hash = { key1: 'val1', key2: 'val2' }
puts hash.keys.join("\n")

p 'a'.ord
p 'b'.ord
p 'c'.ord
p 'd'.ord

p 'A'.ord
p 'B'.ord
p 'C'.ord
p 'D'.ord

#byte
"abcd ruby".each_byte {|c| print c, ' ' }
puts
"12345".each_byte {|c| print c, ' ' }
puts
"10 11 12 13 14".each_byte {|c| print c, ' ' }
puts
"789".each_byte {|c| print c, ' ' }
puts

"\001\002\003\004\005\006\007".each_byte {|c| print c, ' ' }
puts

"\010\011\012\013\014\015\016\017".each_byte {|c| print c, ' ' }
puts

"\020\021\022\023\024\025\026\027".each_byte {|c| print c, ' ' }
puts

p "\001".unpack('C')
p "\007".unpack('C')
p "\010".unpack('C')

p "0xAA".to_i(16)
p "AA".to_i(16)
p 170.chr
p "\170".ord

p 120.chr

################################
#Decode
#20 20 3C 6B 65 72 6E 69 6E 67 20 66 69 72 73 74 3D 22 31 30 39 31 22
puts '*'*40

p "20".to_i(16)
p 32.chr

def convertor(integer)
	c = integer.to_i(16)
	c.chr
	c
end

p convertor("73")

p "\x20".encode("UTF-8", "Windows-1252")
p "\x20".encode("UTF-8", "Windows-1252")
p "\x6b".encode("UTF-8", "Windows-1252")

p "\xA8".encode("UTF-8", "Windows-1252")
p "\xE9".encode("UTF-8", "Windows-1252")
p "\xA5".encode("UTF-8", "Windows-1252")
p "\x49".encode("UTF-8", "Windows-1252")

p '*'*40
"abcd".each_byte {|c| print c, ' ' }
puts
"abcd".each_byte {|c| puts "#{c} = #{c.chr}" }
puts


public

def capitalize_better
	 raise ArgumentError, 'String empty!' if self.empty?
	self[0].capitalize + self[1, size]
end

p 'my name Den'.capitalize_better
#p ''.capitalize_better
