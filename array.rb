#arr1 = [1,2,3,4,5]
#puts arr1

#arr2 = Array.new(5){|index| index +1}
#puts arr2

#arr3 = (1..5).to_a
#puts arr3

#arr4 = (10..20).to_a
#puts arr4[-5]
#puts
#puts arr4[3..-5]

#arr5 = ["1", 2, "two", 3]
#puts arr5.size
#puts arr5

=begin
arr6 = [1, 4, 30, 233]
arr7 = ["bmw", "audi", "kia", "lada"]
puts arr6.max
puts arr6.min
puts arr7.max_by{|a| a.size}
puts arr7.min_by{|a| a.size}
puts arr6.sort
puts arr7.sort
puts arr7.sort_by{|i| i.size}
puts arr6.uniq
=end

#arr = [[1,2],[3,4]]
#puts arr.flatten

#arr = [nil, nil, 1, 'two', "two"]
#puts arr.compact.uniq
#arrmax = [[1,2],[3,4]]
#puts arrmax.map{|i| i.max}
#puts arrmax.transpose.map{|i| i.max}

#arr = [1,2,3,4,5,6,7,8,9]
#puts arr.push(10)
#puts arr.pop
#puts arr.unshift(0)
#puts arr.shift

#arr = [1,2,3,4,5,6,7,8,9,"apple"]
#puts arr.include?(5)
#puts arr.include?(10)
#puts arr.include?("apple")
#puts arr.empty?

#arr = [1,2,3,4,5,6,7,8,9]
#puts arr.map{|i| i*2}

#arr = [1,2,3,4,5,6,7,8,9]
#puts arr.find_all{|i| i % 2 == 0}
#puts arr.find_all{|i| i.odd?}
#puts arr.find_all{|i| i.even?}

#arr = [1, "tow", 3.0]
#puts arr

#arr = Array.new(3) 
#puts arr

=begin
arr = [1,2,3,4,5,6,7,8,9,10]
puts arr[0]
puts arr[-1]

puts arr.first
puts arr.last

print arr[-5..-1] 
print arr[0..4]
puts
puts arr.take(5)
puts
puts arr.drop(5)

cars = ["bmw", "audi", "kia", "renault", "ford"]
puts cars.length
puts cars.count
puts cars.empty?
puts cars.any?
puts cars.include?("kia")
puts cars.include?("lada")

arr = [1,2,3,4,5,6,7,8,9,10]

puts arr.push(11)
puts arr << 12
puts arr.pop
puts arr
puts arr.unshift(0)
puts arr.shift

arr = [1, "one", 2, "two", 2, 3, "three", 4, 4, "four", "four"]
puts arr.delete_at(1)
puts arr
puts arr.delete(4)
puts arr
puts
puts arr.uniq

arr = [1, 2, 2, 3, 4, 4,]
p arr.delete_if {|i| i < 3}
p arr.drop(2)

arr = [1,2,3,4,5,6,7,8,9,10]
p arr.each {|i|i}
p arr.map {|i| i*2}
p arr.select {|i| i > 5}
p arr.reject {|i| i < 5}
p arr.drop_while { |a| a < 4 }
p arr.delete_if { |a| a < 4 }

arr1 = [1,2,3,4,5,6,7,8,9,10]
p arr1.keep_if { |a| a < 4 }

p [1,1,3,5] & [ 1,2,3,6]
p ['a','b','b','z'] & ['a','b','c','d']
p [1,2,3] * 3
p [1,2,3] * ","
p [1,2,3] + [4,5]

arr = [1,2,3]
p aar.clear

arr = ["a", "b", "c"]
p arr.collect {|i| i + "!"}
p arr.map.with_index {|i,x| i*x}
p arr.map! {|i| i + "!"}

a = [1,2,3]
b = [4,5,6, [7,8]]
c = [a,b,9,10]
p c.flatten

a = [1,2,4,5]
p a.insert(2, 3)

a = ["a", "b", "c"]
p a.join
p a.join("-")

arr = ["c", "b", "a"]
p arr.reverse
p arr.reverse_each {|i| print i}

arr = [ "a", "b", "b", "b", "c" ]
p arr.rindex("b")        

arr = [1,2,3,4,5]
p arr.select {|i| i.odd?}
p arr.select {|i| i.even?}

arr = ["d","a","e","c","b"]
arr.sort                    
arr.sort { |x,y| y <=> x }  

arr = [1, 7, 2, 3, 4, 5, 0]
p arr.take(3)
p arr.take_while {|i|i < 3}

arr = ["a","b","c","d"]
p arr.values_at(0,2)
p arr.values_at(1,3)

arr = ["ab","d", "b", "ccc"]
p arr.max
p arr.max_by{|i| i.size}
p arr.min
p arr.min_by{|i| i.size}

arr2 = [1,22,3,4]
p arr2.max
p arr2.min

arr = [[1,0], [2,22], [7,15], [4,8]]
p arr.sort_by{|i| i[1]}
p arr.sort_by{|i| i[0]}

arr2 = ["ab","d", "b", "ccc"]
p arr2.sort.reverse
p arr2.sort_by{|i| i.size}.reverse

arr = [[1,2], [3,4], [5,6]]
p arr.map{|i| i.max}
p arr.transpose.map{|i| i.max}

arr = [1,2,3,4,5]
p arr.inject(0){|result, i| result + i }
p arr.inject(1){|result, i| result * i }

arr = [1,2,3,4,5,6,7,8,9,10]
p arr.partition{|i| i.odd?}
one, two = arr.partition{|i| i.odd?}
p one
p two

arr = [1,2,2,3]
p arr.inject(true){|result, i| result && (i > 2) }
p arr.find_all{|i| i <= 2 }.size.zero?
p arr.all?{|i| i > 2 }
p arr.inject(false){|result, i| result || (i > 2) }
p arr.any?{|i| i > 2 }

symbols = ["a".."z", "A".."Z", "0".."9"].map{ |range| range.to_a }.flatten
p (0...12).map{ symbols[rand(symbols.size)] }.join
=end

arr = [2, 1, 3, 5, 6, 7, 4]
p arr.sort{ |x, y| y <=> x }

































































