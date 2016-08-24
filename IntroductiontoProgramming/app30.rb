p arr = []
p arr = [1,"den"]
p arr = Array.new
p arr = Array.new(3)
p arr = Array.new(3, "true")
p arr = Array.new(3){Hash.new}
p arr = Array({:a => "a", :b => "b"})

arr = ["one", "two", "three", "four"]
p arr[0]
p arr[1..2]
p arr[-1]
p arr[-2..-1]

p arr.first
p arr.last
p arr.first(2)
p arr.last(2)

arr = ['a', 'b', 'c', 'd', 'e', 'f']
p arr.take(3)
p arr.drop(3)
p arr.length
p arr.count
p arr.empty?
p arr.include?("z")
p arr.include?("c")

arr = [1, 2, 3, 4]
p arr.push(5)
p arr << 6
p arr.unshift(0)
p arr.insert(3, "Den")


arr =  [1, 2, 3, 4, 5, 6]
p arr.pop
p arr.shift
p arr.delete_at(2)
p arr.delete(3)
p arr

arr = ['foo', 0, nil, 'bar', 7, 'baz', nil]
p arr.compact

arr = [2, 5, 6, 556, 6, 6, 8, 9, 0, 123, 556]
p arr.uniq

arr.each{|i| p i}

arr = [5,2,3]
p arr.map{|i| p i**2}


arr = [1, 2, 3, 4, 5, 6]
p arr.select { |a| a > 3 }
p arr.delete_if { |a| a < 4 }

p [ 1, 1, 3, 5 ] & [ 1, 2, 3 ]                
p [ 'a', 'b', 'b', 'z' ] & [ 'a', 'b', 'c' ]

p [ 1, 2 ] << "c" << "d" << [ 3, 4 ]
p [] << "Php" << "Ruby"

arr = [1,2,3]
p arr.clear

p [ "a", "b" ].concat( ["c", "d"] )
a = [1,2,3]
p a.concat([4,5])

scores = [ 97, 42, 75 ]
p scores.delete_if {|score| score < 80 }

arr = [1,2,3,4,5]
p arr.reverse
p arr.rotate
p arr.sample

p [1,2,3,4,5].select { |num|  num.even?  }

a = [ "d", "a", "e", "c", "b" ]
p a.sort!                   
p a.sort! { |x,y| y <=> x }