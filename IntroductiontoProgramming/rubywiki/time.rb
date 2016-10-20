p Time.new
p Time.new(2016)
p Time.new(2016, 10, 19, 21, 32, 59, "+03:00")

time = Time.new
p time.monday?
p time.tuesday?   
p time.wednesday?   
p time.thursday?
p time.friday?    
p time.saturday?  
p time.sunday?

p time.year

p time
p time + (60)
p time + (60*60)
p time + (60*240)
p time + (60*60*24)
p time + (60*60*24*365)

p "="*20
p time.to_i

t1 = Time.new
t2 = Time.new(2015)

p t1 == t2
p t1 > t2
p t1 < t2


p Time.at(0)
p Time.at(1476903011)
p Time.at(-284061600)

p Time.new.utc
p Time.utc(2016, 10, 19, 21, 32, 59,)
p Time.local(2016, 10, 19, 21, 32, 59,)

p "="*20

p t = Time.now
p t +(60 * 60 * 24)
p t + 2592000
p t.year
p t.month
p t.day
p t.hour
p t.min
p t.sec
p t.zone
p t.yday

time = Time.now
p time.strftime("%m.%d.%Y %H:%M:%S %z")
p time.strftime("%m.%d.%Y %H:%M:%S UTC")