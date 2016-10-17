p '123 45 76' =~ /\d+/
p '123 45 76' =~ /\d\d\d/
p '123 45 76' =~ /\d{3}/
p '123 45 76' =~ /\d{2}/
p '123 45 76' =~ /\d{4}/
p "found" if '123 45 76' =~ /\d+/

p '123 45 76'.scan(/\d+/)
p '123 45 76'.scan(/(\d{3}) (\d{2}) (\d{2})/)
p '123 45 76 and 843 11 22 33'.scan(/(\d{3}) (\d{2}) (\d{2})/)

p "===================="
a = '892 34 56 and +7843 599 00 00 and 523-00-00 and 8843 988 10 10'
p a.scan(/(\d{3}) (\d{2}) (\d{2})/)


p /1/ =~ '12345'
p /[1]/ =~ '12345'
p /[1-9]/ =~ '9'

p /hello/ =~ 'h'
p /[hello]/ =~ 'h'

#validation
p /spam/ =~ "Hello world!"
p /spam/ =~ "Hello world! spam"

p /[a-zA-Z0-9]/ =~ "abCD89"

p /[^a-c]/ =~ "a"
p /[^a-c]/ =~ "z"

p /\d/ =~ "123456789"
p /\w/ =~ "abc123"
p /\s/ =~ "\n\s\t"

p /\D/ =~ "string"
p /\D/ =~ "12345"

p /(ruby!){1}/ =~ "ruby!"
p /(ruby!){2}/ =~ "ruby!"
p /(ruby!){2}/ =~ "ruby!ruby!"
p /(ruby!){1,}/ =~ "ruby!ruby!ruby!"
p /(ruby!){2,3}/ =~ "ruby!ruby!ruby!"

p "true number!" if /\+([\d]){4}-([\d]{6})/ =~ "+7843-5900000"
p "true number!" if /\+7 ([\d]{3}) ([\d]{3})-([\d]{2})-([\d]{2})/ =~ "+7 927 000-00-00"
p "true number!" if /8 ([\d]{3}) ([\d]{3})-([\d]{2})-([\d]{2})/ =~ "8 927 000-00-00"

p "true" if /\+7|8 ([\d]{3}) ([\d]{3})-([\d]{2})-([\d]{2})/ =~ "8 927 000-00-00"

p "true" if /\+7|8 ([\d]{3}) ([\d]{3})-([\d]{2})-([\d]{2})/ =~ "+7 927 000-00-00"


a = "8 927 000-00-00 +7 927 000-00-00 +7 965 000-00-00 +7 999 000-00-00 +7 9270000000 +79650000000"
arr = a.scan(/\+(7) (\d{3}) (\d{3})-(\d{2})-(\d{2})|(8) (\d{3}) (\d{3})-(\d{2})-(\d{2})|\+(7)(\d{10})/)

b = []
arr.each do |i|
	b << i.compact.join("")
end
puts b.uniq!


str = "Hi ruby
       Hi php"

p str.scan(/^(Hi)/)


def ip_address?(str)
  !!(str =~ /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/)
end
 
p ip_address?("192.168.1.1")
p ip_address?("0000.0000")



str = "hi world, ruby"
p str.gsub(/\w+/) { |w| w.capitalize }


name = "Mr. Ned Beatty
Diana Christensen
Mr. Max Schumacher
Mr. Robert Duvall
Mr. Frank Hackett
Beatrice Straight
Faye Dunaway
Mr. Howard Beale
Louise Schumacher           
Mr. William Holden
Mr. Arthur Jensen
Carolyn Krigbaum
Cindy Grover
Mr. Peter Finch"


namereg = name.scan(/^(Mr.) (\w+){1,} (\w+){1,}|^(?!Mr)(\w+){1,} (\w+){1,}/)

name = []
namereg.each do |i|
	name << i.compact.join(" ")
end

puts name