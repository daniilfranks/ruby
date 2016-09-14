i = [1,2,3,4,5]
s = ["a","b","c"]
c = [2,4,7,9]
z = i + s
puts z.inspect

x = i - c
puts x.inspect


q1 = %w[Jan Feb Mar]
q2 = %w[Apr May Sep]
q3 = q1 + q2
puts q3
puts q3[0]

arr = []
arr << "Den" << "Jok"
p arr


gr = [12,567,23,86,94]
sum = 0

gr.each do |g|
	sum += g
end

puts sum

ave = sum / gr.length
puts ave


is = ["den", 4,949,21,43,"nil"]
is.each{|i| p i.to_s}

p is[0]
p is[-1]
p is.length
is.delete "nil"
p is

a = ['a','b','c']
a.each_index {|i| puts i}

p a.empty?

p a.find_all{ |x| x < "b" }
p a.first
p a.last
puts a.first(3).join("-")

integer = [1,23,546,34,213]
p integer.grep(Integer)
p integer.grep(20..35)

arr = ["Ruby","php","Python","perl","go", "nil"]
p arr.grep(/^R/)
p arr.grep /[pg]/
p arr.include?("Ruby")
p arr.include?("C+")
p arr.insert("nil")

puts arr.join(", ")
puts arr.map{|x| "/#{x}/"}
puts arr.map{|x| x.capitalize}
arr.pop
puts arr

a = ['a','b','c']
p a.replace([1,2,3])

a = ['a','b','c']
a.reverse_each {|e| puts e}

a.shift
p a

b = [2,4,3,6,5]
p b.sort
p b[1..3]

d = []
c = Array.new
a = Array.new(3, "true")
puts a
puts a.size
puts a.length
puts a.empty?

d = Array(0..5)
p d
p d.max
p d.min

arr = ["Jan", 1, :one, [2015,12,01]]
p arr


int = [12,2,4]
p int
int[0] = 1
int[2] = 3
p int

x = 2
int[x] = "exe"
p int

int[1] += 5
p int

w = ["car","box","cat"]
x = 0

while x < w.length
	puts "#{x+1}: #{w[x]}"
	x += 1
end

arr = [1,2,3,4,5]
p arr.collect{|i| i ** 2}
p arr.delete_at(-1)
arr.clear
p arr.empty?

arr = [1,2,3,4,5]
arr.each do |i|
	if i % 2 == 0
		puts "#{i} even"
	else
		puts "#{i} odd"
	end
end

n = ["carl","den","joc"]
n.each_with_index{|name,index| puts "#{index+1}: #{name}"}
#n.freeze
#n << "alex"
#p n
n.pop
n.push "Zak"
p n
p n.reverse


