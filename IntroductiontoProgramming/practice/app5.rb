person = "Den"
p person.class
p person.object_id
p person

person2 = person
p person2[0]

a = [3.14123, "cat", 99]
p a.class
p a.length
p a[0]
p a[1]
p a[2]
p a[3]

a = Array.new
p a.class
p a.length
a << "cat"
a << "dog"
p a
p a[-1]

b = [1,2,3,4,5,6,7,8]
p b[0..4]
p b[-3..-1]
p b.push 9
b.pop 2
p b
b.shift 2
p b
p b.first(2)
p b.last(2)

hash = { 'dog' => 1, 'cat' => 2}
p hash.length
p hash['dog']
p hash['zebra'] = 3
p hash
hash['cat'] = 88
p hash