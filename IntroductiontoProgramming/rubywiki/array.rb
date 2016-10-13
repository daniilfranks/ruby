p Array.[](1,"a",["proc","lambda"])
p Array.new(1, "cat")
p Array.new(10) { |i| i }
p Array.new(2)
p Array.new(5, "A")

a = Array.new(2) {Hash.new}
p a
a[0]['cat'] = 'feline'
p a
a[1]['cat'] = 'Felix'
p a

p [1,1,2,2,3,6,4] & [1,2,7]
p [1,1,2,2,3,6,4] | [1,2,7]
p [1,2,3] * 2
p [1,2,3] * ","
p [1,2,3] * "-"
p [1,2,3] + [4,5]
p [-1,0,1,2,3,4,5] - [1,2,3]
p [1,2] << 3 << [5,6]

p ["a","b","c"] <=> ["a","b"]
p ["a","b","c"] <=> ["a","b","c"]
p ["a","b"] <=> ["a","b","c"]

p ["a","b","c"] == ["a","b"]
p ["a","b","c"] == ["a","b","c"]
p ["a","b"] == ["a","b","c"]

a = ["a", "b", "c", "d", "e"]
p a[2] + a[4]
p a[1]
p a[2,3]
p a[0..2]
p a[-3..-1]

a = [
	[:id1, "den", 25],
	[:id2, "jok", 29],
	[:id3, "leo", 37]
]

p a.assoc(:id2)
p a.assoc(:id100)

p a.rassoc("leo")
p a.rassoc("io")

p a.at(0)
p a.at(-1)

arr = [1,2,3,4,5]
p arr.clear

arr = [1,2,3,4,5]
p arr.collect { |x| x + 2 }

arr = ("a".."e").to_a
p arr.collect { |x| x + "!"}


arr = [nil, nil, 1,2,3,nil,4]
p arr.compact

arr1 = [1,2,3,4]
arr2 = [5,5,6,7]
p arr1.concat(arr2)


arr = [1,2,3,4,5]
p arr.count
p arr.count { |i| i.odd? }


arr = ("a".."z").to_a
p arr.delete("b")
p arr.delete("zz") { "not found" }

p arr.delete_at(2)
p arr.delete_at(99)

arr = ("a".."z").to_a
p arr.delete_if { |i| i >= "k" }

arr = (1..30).to_a
p arr.delete_if { |i| i <= 16 }

arr = ("a".."z").to_a
p arr.reject { |i| i >= "k" }

arr = (1..30).to_a
p arr.reject { |i| i <= 16 }

arr = (1..30).to_a
p arr.drop(10)

p arr.drop_while { |i| i < 15}


arr = ("a".."d").to_a
arr.each {|i| p i }
arr.each_index { |i| p i}


p [].empty?
p [1].empty?


arr = ("a".."d").to_a
p arr.fetch(1)
p arr.fetch(15) { |i| puts "#{i} is out of bounds" }
p arr.fetch(5, 'cat')


arr = ("a".."d").to_a
p arr.fill("x")
p arr.fill("a", 0..2)
p arr.fill{|i| i*i }


arr = ["a","b","c","a"]
p arr.index("c")
p arr.index("z")

p arr.first
p arr.first(2)


arr = [[1,2],[3,4,5],[[6,7],[8,9]]]
p arr.flatten

arr = [1,2,3]
p arr.flatten


frozen_array = [1,2,3,4,5]

p frozen_array.frozen?
frozen_array.freeze
p frozen_array.frozen?

#p frozen_array.pop

p frozen_array.hash
p frozen_array.object_id


arr = ("a".."c").to_a
p arr.include?("a")
p arr.include?("z")


arr = [1,2,3,4,5]
p arr.insert(2,99)
p arr.insert(-2,12,23,34)


a = ["a", "b", "c", 12, 453]
p a.to_s


arr = ("a".."d").to_a
p arr.join
p arr.join(" ")
p arr.join(", ")
p arr.join("-")

p arr.last


arr = ("a".."g").to_a
p arr.keep_if { |v| v =~ /[aeiou]/ }

arr = ("a".."g").to_a
p arr.keep_if { |v| v > "d" }

arr = [1,2,3,4,5]
p arr.keep_if { |v| v < 3 }

arr = [1,2,3,4,5]
p arr.keep_if { |v| v.odd? }


arr = [1,2,3,4,5, "cat", "dog", ["arr", "hash"]]
p arr.length
p arr.size


arr = [1,2,3,4,5]
p arr.map { |x| x + 2 }
p arr.map { |x| x * x }

arr = ("a".."e").to_a
p arr.map { |x| x + "!"}

p (1..3).map { "demo" }


a = [1, 2, 3]
p a.permutation.to_a
p a.permutation(1).to_a
p a.permutation(2).to_a
p a.permutation(3).to_a


arr = [1,2,3,4,5]
p arr.pop
p arr.pop(2)
p arr

arr = [1,2,3,4,5]
p arr.push(6)
p arr.push(7,8,9)


a = ["a","b","c"]
b = [1,2,3]
p a.replace(b)


a = ["a","b","c"]
p a.reverse
a.reverse_each { |i| puts i }


a = ["a","b","c","b",1,22,3,4,56,56,"b",7]
p a.rindex("b")
p a.index("b")


a = ["a","b","c","d","e"]
p a.rotate
p a.rotate(2)


a = (1..100).to_a
p a.sample
p a.sample(4)


a = (1..5).to_a
p a.select { |i| i.even? }

a = ("a".."e").to_a
p a.select { |i| i =~ /[aeiou]/ }


a = ("a".."e").to_a
a.shift
a.shift(2)
p a


#random
a = [ 1, 2, 3 ]
p a.shuffle


a = ("a".."z").to_a
p a.slice(2)
p a.slice(15..18)
p a.slice(0,5)


a = ["a", "c", "d", "z", "y"]
p a.sort
p a.sort { |x,y| y <=> x }


a = (1..10).to_a
p a.take(5)
p a.take_while { |i| i < 5 }


a = ["a", "c", "d", "z", "y"]
p a.to_s


a = [[1,2,3],[4,5,6],[7,8,9]]
p a.transpose


a = [["Den",25,"Kazan"],["Oleg",65,"Omsk"],["Ivan",35,"London"]]
p name = a.transpose
p name[0]


a = ["a","a","b","c"]
p a.uniq


a = ["a", "c", "d", "z", "y"]
p a.unshift("a")
p a.unshift("x","x","x")


a = ["a", "c", "d", "z", "y"]
p a.values_at(0,2,4)
p a.values_at(-1,2)
p a.values_at(1..3)
p a.values_at(99)


a = [1,2,3]
b = [4,5,6]
c = [7,8,9]

p a.zip(b,c)