require 'date'

puts Date.new(2016,1,1)

puts Date.jd(2458000)

puts Date.ordinal(2016,62)

puts Date.strptime('25-11-2016', '%d-%m-%Y')

d = Date.parse('25-11-2016')
p d.year
p d.mon
p d.mday
p d.wday
p d.strftime('%a %d %b %Y')


s1 = Date.parse('01-01-2016')
s2 = Date.parse('01-03-2016')
puts (s2 - s1).to_i

a1 = Date.parse('01-01-2016') >> 1
puts a1

a1 = Date.parse('01-01-2016') + 1
puts a1

puts a1.yday
puts a1.year
puts a1.mon


r1 = Date.parse('01-01-2016')
r2 = Date.parse('31-01-2016')
array = (r1..r2).to_a
puts array
puts array[6].friday?
puts array[7].friday?

hash = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]
range = ('1'..'12').to_a
year = hash.zip(range).to_h
p year


cal1 = Date.parse('01-01-2016')
cal2 = Date.parse('31-01-2016')
array = (cal1..cal2).to_a
p array
p array[5].mday
p array[5].wday

monday = []
array.select { |k,v| monday << k if k.friday? }
puts monday

p array.length

date = Date.new(2017)
puts date
puts date.monday?
puts date.saturday?
puts date.sunday?
puts date.thursday?
puts date.tuesday?
puts date.wednesday?
puts date.friday?

puts date.to_s
puts date.to_time
puts date.to_date
puts date.to_datetime

puts date + 2
puts date - 1
puts date << 1
puts date >> 1
puts date.next_day
puts date.next_month
puts date.next_year
puts date.prev_day
puts date.prev_month
puts date.prev_year

puts date.year
puts date.month
puts date.wday
puts date.yday
puts date.cwday
puts date.cweek
puts date.day