age = 25
#p 'Access' if age >= 18

age = 22
#p 'Access' if age > 18 && age < 21

age = 25
#p 'Access' if age == 26

age = 25
#p 'Access' if age > 50 || age < 18

age = 25
gender = 'm'
#p 'Access' if age > 21 && gender == 'm'
#p 'Access' if gender == 'm' && (age < 18 || age > 50)

#1.upto(3) { p 'Ruby' }
#3.downto(1) { p 'JS' }
#1.step(3,1) { p 'GO' }

#p 10 / 3
#p 10.0 / 3
#p 10.to_f
#p 10.0.to_i

#p 'a'.ord
#p 'A'.ord
#p 'z'.ord
#p 'Z'.ord

#p 0.chr
#p 1.chr
#p 2.chr
#p 11.chr
#p 110.chr
#p 101.chr
#p 102.chr

array = []
i = 0
while i < 255
	i += 1
	array << i.chr
end

#p array

string = 'I love ruby on rails'
#p string.gsub('on', '')
#p string.gsub(/^./, 'You')
#p string.gsub(/.....$/, 'sinatra')

#p string.scan(/../)
# string.scan(/\w\w/) { |i| puts i }

string = 'Car 1000$'
#p string.scan(/\d+/)
#p string.scan(/[0]/)
#p string.scan(/[0-1]/)

a = [1,2,3,4,5,6,7,8,9,10]

i = 0
while i < a.size
	#puts a[i].to_s + "#{'x' * i}"
	i += 1
end

array = []
#puts 'Array is empty!' if array.empty?

array = [1,2,3,4,5]
x = 1
#puts "Include #{x}!" if array.include?(x)

#puts array.join(' ')

hash = { 'key1' => 'value1', 'key2' => 'value2' }
#p hash.size
#p hash['key2']
hash['key2'] = 'new_value2'
hash['key3'] = 'value3'
#p hash

hash.each { |k, v| p k, v}
#p hash.keys
#p hash.values

hash.delete('key1')
#p hash

hash = { 'users' => { 1 => { name: 'den', age: 25 }, 2 => { name: 'leo', age: 31 } } }

#p hash['users']
#p hash['users'][1]
#p hash['users'][1][:name]

x = 10
#p x >= 10 ? true : false

class Integer
	def second
		self
	end

	def minutes
		self * 60
	end

	def hours
		self * 60
	end

	def days
		self * 60 * 60 * 24
	end
end

#p Time.new
#p Time.new + 10.minutes
#p Time.new + 16.hours
#p Time.new + 7.days

year = 2017
month = 1
day = 20
hour = 17
min = 10
sec = 42
msec = 20

#p Time.local(year, month, day, hour, min, sec, msec)
#p Time.gm(year, month, day, hour, min, sec, msec)

#p ('a'..'z').to_a
#p (1..10).to_a
