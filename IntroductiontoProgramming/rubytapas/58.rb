KEYS = ("a".."z").to_a
VALUES = KEYS.rotate(13)
CYPHER = Hash[KEYS.zip(VALUES)]

def sekrit(text)
	text.downcase.chars.map{ |char|
		CYPHER[char] || char
	}.join
end

p sekrit("Hello world")


a = ("a".."z").to_a
b = a.rotate(13)
p a.zip(b)