require 'pp'

a = 'string'
pp a

b = 1
pp b

arr = ['string', 1, ['string', 2]]
pp arr

hash = {name: 'Den', age: 25}
pp hash

File.open('text.txt', 'r').each do |w|
  pp w
end