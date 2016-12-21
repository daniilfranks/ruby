require 'pp'

items = [
        { name: 'car',        money: 49,  count: 1 },
        { name: 'car',        money: 49,  count: 1 },
        { name: 'car',        money: 49,  count: 1 },
        { name: 'helicopter', money: 169, count: 1 },
        { name: 'bus',        money: 75,  count: 1 },
        { name: 'ship',       money: 99,  count: 1 },
        { name: 'car',        money: 49,  count: 1 },
        { name: 'truck',      money: 23,  count: 1 },
        { name: 'helicopter', money: 169, count: 1 }
        ]

#pp items.group_by { |i| i[:name] }.collect{ |k, v| 
#         v[1..-1].each {|x| v[0][:money] += x[:money]; v[0][:count] += x[:count]}
#         v[0]
#        }


# pp items = items.group_by { |i| i[:name] }


car = { "car"=>
        [{:name=>"car", :money=>49, :count=>1},
        {:name=>"car", :money=>49, :count=>1},
        {:name=>"car", :money=>49, :count=>1},
        {:name=>"car", :money=>49, :count=>1}]
        }

#pp car.values[0][0][:name]
#pp car.values[0][0][:money]
#pp arr = car.values[0]

v = car.values[0]

money = count = 0
v.each { money += v[0][:money]; count += 1 }
v.uniq!
v[0][:money], v[0][:count] = money, count
pp v