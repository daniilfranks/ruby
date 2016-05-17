<h1>Array</h1 >
arr = []
arr = Array.new
arr = ().to_a

arr = [1,2,3,4,5,6,7,8,9,10]

arr[0]       arr.first     #1
arr[-1]      arr.last      #10

arr[1..5]    arr.take(5)   #1,2,3,4,5
arr[-5..-1]  arr.drop(5)   #10,9,8,7,6

cars = ["bmw", "audi", "kia", "renault", "ford"]
puts cars.length           #5
puts cars.size             #5
puts cars.count            #5
puts cars.empty?           #false
puts cars.any?             #true
puts cars.include?("kia")  #true
puts cars.include?("lada") #false

puts arr.push(11)          #1,2,3,4,5,6,7,8,9,10,11
puts arr << 12             #1,2,3,4,5,6,7,8,9,10,11,12
puts arr.pop               #1,2,3,4,5,6,7,8,9,10,11
puts arr.unshift(0)        #0,1,2,3,4,5,6,7,8,9,10,11
puts arr.shift             #1,2,3,4,5,6,7,8,9,10,11

arr = [1, "one", 2, "two", 2, 3, "three", 4, 4, "four", "four"]
puts arr.delete_at(1)      #1,2,"two",2,3,"three",4,4,"four","four"
puts arr.delete(4)         #1,2,"two",2,3,"three","four","four"
puts arr.uniq              #1,2,"two",3,"three","four"

arr = [1, 2, 2, 3, 4, 4,]
p arr.delete_if {|i| i < 3} #[3, 4, 4]

arr = [nil, 1, nil, 2, nil, 3 ,nil]
puts arr.compact           #1,2,3

arr = [1,2,3,4,5,6,7,8,9,10]
p arr.each {|i|i}          #1,2,3,4,5,6,7,8,9,10 
p arr.map {|i| i*2}        #2,4,6,8,10,12,14,16,18,20]
p arr.select {|i| i > 5}   #6,7,8,9,10
p arr.reject {|i| i < 5}   #5,6,7,8,9,10
p arr.drop_while { |a| a < 4 } #4,5,6,7,8,9,10
p arr.delete_if { |a| a < 4 }  #4,5,6,7,8,9,10
p arr.drop(2)                  #[2, 3, 4, 4]

arr1 = [1,2,3,4,5,6,7,8,9,10]
p arr1.keep_if { |a| a < 4 }   #1,2,3

p [1,1,3,5] & [ 1,2,3,6]       #[1, 3]
p ['a','b','b','z'] & ['a','b','c','d']  #["a", "b"]
p [1,1,3,5] | [ 1,2,3,6]       #[1, 3]
p [1,2,3] * 3                  #[1, 2, 3, 1, 2, 3, 1, 2, 3]        
p [1,2,3] * ","                #"1,2,3"
p [1,2,3] + [4,5]              #[1, 2, 3, 4, 5]
p [1,2,3,44,78] - [1,4,5,44]   #[2,3]

arr = [1,2,3]                    
p arr.clear                      #[]

arr = ["a", "b", "c"]
p arr.collect {|i| i + "!"}      #["a!", "b!", "c!"]
p arr.map.with_index {|i,x| i*x} #["", "b", "cc"]
p arr.map! {|i| i + "!"}         #["a!", "b!", "c!"]

arr = [[1,2], [3,4], [5,6]]
p arr.map{|i| i.max}             #[2, 4, 6]
p arr.transpose.map{|i| i.max}   #[5, 6]

a = [1,2,3]
b = [4,5,6, [7,8]]
c = [a,b,9,10]
p c.flatten                      #[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

a = [1,2,4,5]
p a.insert(2, 3)                 #[1, 2, 3, 4, 5]

a = ["a", "b", "c"]          
p a.join                         #"abc"
p a.join("-")                    #"a-b-c"

arr = ["c", "b", "a"]            
p arr.reverse                    #["a", "b", "c"]
p arr.reverse_each {|i| print i} #abc

arr = [ "a", "b", "b", "b", "c" ]
p arr.rindex("b")                 #3

arr = [1,2,3,4,5]
p arr.select {|i| i.odd?}         #[1, 3, 5]
p arr.select {|i| i.even?}        #[2, 4]

arr = ["d","a","e","c","b"]
arr.sort                            # ["a","b","c","d","e"]
arr.sort { |x,y| y <=> x }          # ["e","d","c","b","a"]
p arr.sort_by{|i| i.size}

arr = ["ab","d", "b", "ccc"]
p arr.sort_by{|i| i.size}           #["d", "b", "ab", "ccc"]

arr = [[1,0], [2,22], [7,15], [4,8]]
p arr.sort_by{|i| i[1]}
p arr.sort_by{|i| i[0]}             #[[1, 0], [2, 22], [4, 8], [7, 15]]

arr2 = ["ab","d", "b", "ccc"]       #[[1, 0], [4, 8], [7, 15], [2, 22]]
p arr2.sort.reverse                 #["d", "ccc", "b", "ab"]
p arr2.sort_by{|i| i.size}.reverse  #["ccc", "ab", "b", "d"]

arr = [1, 7, 2, 3, 4, 5, 0]
p arr.take(3)                       #[1,7,2]
p arr.take_while {|i|i < 3}         #[1]

arr = ["a","b","c","d"]
p arr.values_at(0,2)                #["a", "c"]
p arr.values_at(1,3)                #["b", "d"]

arr = ["ab","d", "b", "ccc"]
p arr.max                           #"d"
p arr.max_by{|i| i.size}            #"ccc"
p arr.min                           #"ab"
p arr.min_by{|i| i.size}            #"d"

arr2 = [1,22,3,4]
p arr2.max                          #22
p arr2.min                          #1

arr = [1,2,3,4,5]
p arr.inject(0){|result, i| result + i }  #15
p arr.inject(1){|result, i| result * i }  #120

arr = [1,2,3,4,5,6,7,8,9,10]
p arr.partition{|i| i.odd?}      #[[1, 3, 5, 7, 9], [2, 4, 6, 8, 10]]
one, two = arr.partition{|i| i.odd?}
p one                                #[1, 3, 5, 7, 9]
p two                                #[2, 4, 6, 8, 10]

arr = [1,2,2,3]
p arr.inject(true){|result, i| result && (i > 2) }  #false
p arr.find_all{|i| i <= 2 }.size.zero?              #false
p arr.all?{|i| i > 2 }                              #false
p arr.inject(false){|result, i| result || (i > 2) } #true
p arr.any?{|i| i > 2 }                              #true

symbols = ["a".."z", "A".."Z", "0".."9"].map{ |range| range.to_a }.flatten
p (0...12).map{ symbols[rand(symbols.size)] }.join   #"rHUWuZgsH28b"

arr = [2, 1, 3, 5, 6, 7, 4]
p arr.sort{ |x, y| y <=> x }                    #[7, 6, 5, 4, 3, 2, 1]




































