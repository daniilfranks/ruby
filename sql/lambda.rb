def puts_block(name = 'default')
  yield(name) if block_given?
end

puts_block('Den') { |name| puts "#{name}" }

m_3 = lambda { |n| n % 3 == 0 }
m_12 = lambda { |n| n % 12 == 0 }

p (1..100).to_a.select(&m_3)
p (1..100).to_a.select(&m_12)


rand = rand(1000)
user = (1..7841)

lam = lambda { |i| i % rand == 0 }
p user.select(&lam)


array = (1..100).to_a

s_50 = lambda { |i| i > 50 }

p array.select(&s_50)


items = [['car', 30, 8], ['helicopter', 50, 10], ['bus', 45, 6], ['ship', 90, 9], ['truck', 20, 7]]

name_sort_reverse = lambda { |k, v| v <=> k }
price_sort = lambda { |p| p[1] }
price_sort_reverse = lambda { |k, v| v[1] <=> k[1] }
rate_sort = lambda { |p| p[2] }
rate_sort_reverse = lambda { |k, v| v[2] <=> k[2] }

p items.sort
p items.sort(&name_sort_reverse)
p items.sort_by(&price_sort)
p items.sort(&price_sort_reverse)
p items.sort_by(&rate_sort)
p items.sort(&rate_sort_reverse)



array = ['car', 'helicopter', 'bus', 'ship', 'truck']

p array.map(&:capitalize)
p array.map(&:reverse)
p array.map(&:upcase)
p array.map(&:to_sym)