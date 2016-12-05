require 'pp'

#Cart
=begin
cart = []
loop do
  puts 'Add item'
  item = gets.strip 
  break if item == ''

  puts 'Add price'
  price = gets.strip.to_i

  puts 'Add quantity'
  quantity = gets.strip.to_i

  cart.push([item, price, quantity])
end
=end


#cart = [['car', 10, 1], ['bar', 5, 3], ['car', 10, 5]]

#p cart.uniq { |i| i.first }

#arr = []
#cart.each do |i|
#  arr << i unless arr.assoc(i[0])
#end
#p arr

#p cart
#p cart.inject(0) { |sum, a| sum + a[1] * a[2] }


items = [
        { name: 'car',        money: 49,  count: 1 },
        { name: 'car',        money: 49,  count: 1 },
        { name: 'car',        money: 49,  count: 1 },
        { name: 'car',        money: 49,  count: 1 },
        { name: 'helicopter', money: 169, count: 1 },
        { name: 'bus',        money: 75,  count: 1 },
        { name: 'ship',       money: 99,  count: 1 },
        { name: 'truck',      money: 23,  count: 1 },
        { name: 'helicopter', money: 169, count: 1 }
        ]

#pp items.inject(Hash.new(0)) { |h, obj|
#      h[obj[:name]] = [] unless h.key?(obj[:name])
#      h[obj[:name]].push(obj); h }
#   .map { |k, v| 
#      count = money = 0
#      v.each { |x| count += 1; money += x[:money] }
#      v[0][:count], v[0][:money] = count, money; v[0] }

#pp items.group_by{ |i| i[:name]}
#      .map{ |k, v| 
#         v[1..-1].each {|x| v[0][:money] += x[:money]; v[0][:count] += x[:count]}
#         v[0]
#      }

#pp items.group_by{ |i| i[:name]}
#      .map{ |k, v| 
#         v[1..-1].each {|x| v[0][:money] += x[:money]; v[0][:count] += x[:count]}
#         v[0]
#      }


#pp items.each_with_object({}) { |h, obj|
#  obj[h[:name]] ||= {money: 0, count: 0}
#  obj[h[:name]][:money] += h[:money]
#  obj[h[:name]][:count] += h[:count]
#}.map{ |k, v| {name: k}.merge(v) }