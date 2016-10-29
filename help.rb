#<h1>Array</h1 >
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

====================================================================
<h1>Hash</h1 >

hash = {1=>4, 2=>8, 4=>11, 7=>17}
p hash[1]              #4
p hash[3]              #nil
p hash[7]              #17

arr = [1,3,4,56,23,1,3,2,56,23,3,4,56]
p arr.inject(Hash.new{0}){|result,i| 
	result[i] += 1 
	result              #{1=>2, 3=>3, 4=>2, 56=>3, 23=>2, 2=>1}
}

arr = [["book1", 29], ["book2", 57], ["book3", 34]]
book_name = "book2"
p arr.find_all{|key, value| key == book_name}[0][-1]  #57

hash = {"book1" => 29, "book2" => 57, "book3" => 34 }
p hash["book2"]                                       #57

arr1 = [1,2,3,4,5,6]                
p Hash[*arr1]                       #{1=>2, 3=>4, 5=>6}

arr2 = [[10,11], [12,13], [14,15]] 
p Hash[*arr2.flatten]               #{10=>11, 12=>13, 14=>15}

arr3 = [[80,81,82], [70,71,72]]
p Hash[*arr3.transpose.flatten]     #{80=>70, 81=>71, 82=>72}

hash = {}
hash[1] = 4
hash[2] = 9
p hash                              #{1=>4, 2=>9}

hash = Hash.new("")
hash["first"] += "title"
hash["two"]   += "title"
p hash                              #{"first"=>"title", "two"=>"title"}

hash = Hash.new(0)
hash["tax"] += 13
hash["tax"] += 34
p hash                              #{"tax"=>47}                 

hash1 = {1=>3, 4=>6, 8=>11}.keys
hash2 = {1=>3, 4=>6, 8=>11}.values
p hash1                             #[1, 4, 8]
p hash2                             #[3, 6, 11]

hash1 = {"book1" => 10, "book2" => 23}
p hash1.invert              #{10=>"book1", 23=>"book2"}

hash2 = {"book2" => 10, "book3" => 10}
p hash2.invert              #{10=>"book3"}           

p hash1.merge!(hash2)       #{"book1"=>10, "book2"=>10, "book3"=>10}
p hash1.size                #3

hash = {2=>3, 4=>7, 9=>8}
hash.delete(4)
p hash                      #{2=>3, 9=>8}
p hash.to_a                 #[[2, 3], [9, 8]]
p hash.max                  #[9, 8]
p hash.min                  #[2, 3]
p hash.max_by{ |key, value| value }  #[9, 8]
p hash.min_by{ |array| array[0] }    #[2, 3]

hash1 = {}
hash2 = {"book2" => 10, "book3" => 15}
p hash1.empty?               #true
p hash2.empty?               #false
p hash1.key?("book3")        #false
p hash2.key?("book3")        #true
p hash1.include?("book3")    #false
p hash2.include?("book3")    #true
p hash1.value?(15)           #false
p hash2.value?(15)           #true

hash = {"book1"=>50, "book2"=>10, "book3"=>18}
p hash.find_all{ |key, value| value < 15 }     #[["book2", 10]]
p hash.map{ |key, value| "#{key} - #{value}" } #["book1 - 50", "book2 - 10", "book3 - 18"]
p hash.inject(0){ |result, (key, value)| result + value } #78
p hash.select {|key, value| key > "book2"}      #{"book3"=>18}
p hash.select {|key, value| value < 18}         #{"book2"=>10}

arr = {"book1"=>100, "book2"=>200}
arr.each{|key,value| puts "#{key} is #{value}"}  #book1 is 100 book2 is 200
arr.each_key{|key| puts key}                     #book1 book2
arr.each_value{|value| puts value}               #100 200