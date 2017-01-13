# gem install sequel
# gem install awesome_print
# gem install sqlite3

require 'awesome_print'

hash = { 'users' => { 1 => { name: 'Danila', age: 25, city: 'Kazan'  }, 
											2 => { name: 'Leo',    age: 30, city: 'London' }, 
											3 => { name: 'Mark',   age: 19, city: 'Kazan'  } 
										} 
				}

# ap hash
require 'sqlite3'
require 'sequel'

# create db
#DB = Sequel.sqlite('test.db')

#connect db
DB = Sequel.connect('sqlite://test.db')

#Drop table
DB.drop_table :items

DB.create_table :items do
  primary_key :id
  String      :name
  String      :region
  Float       :price
  datetime    :date
end

items = DB[:items]

items.insert(:name => 'car', :region => 'Tatarstan',  :price => 300.00, :date => '2017-01-12 11:51:11 +0300')
items.insert(:name => 'cat', :region => 'Tatarstan',  :price => 400.00, :date => '2017-01-01 11:51:11 +0300')
items.insert(:name => 'dog', :region => 'Sverdlovsk', :price => 500.00, :date => '2017-01-10 11:51:11 +0300')
items.insert(:name => 'delete', :region => 'Sverdlovsk', :price => 800.00, :date => '2017-01-08 11:51:11 +0300')
items.insert(:name => 'update', :region => 'Mariel', :price => 600.00, :date => '2017-01-05 11:51:11 +0300')

# Print out the number of records
puts "Item count: #{ items.count }"

# Print out the average price
puts "The average price is: #{ items.avg(:price) }"

# Print out the average price region Tatarstan
items = DB[:items].where(:region => 'Tatarstan')
puts "The average price is: #{ items.avg(:price) }"

items = DB[:items]
items.order(:name).each{ |r| puts r }
items.order(:name).each{ |r| puts r[:name] }

puts items.map(:name)

puts items.to_hash(:id)
puts items.to_hash(:name, :price)

sql = DB['SELECT * FROM items']
p sql.count
p sql.map(:name)

name_region = 'Tatarstan'
region = DB['SELECT * FROM items WHERE region = ?', name_region]
region.each { |region| puts region }

items = DB[:items]
items.all
items.each { |items| puts items }

p items.first

items.where(:region => 'Tatarstan').each { |items| p items }
items.where(:region => 'Tatarstan', :name => 'cat').each { |items| p items }

p '*'*45
items.where(:date => (Date.today - 10)..(Date.today - 0)).each { |items| p items }

p '*'*45
items.where(:name => ['dog', 'cat']).each { |items| p items }


p '*'*45
p items.max(:price)
p items.min(:price)
p items.sum(:price)
p items.avg(:price)

p '*'*45
items.select(:name).each { |items| p items }

#delete
items.where(:id => 4).delete
items.each { |items| p items }

#update
items.where(:id => 5).update(:price => 1000.00)
items.each { |items| p items }


p '*'*45
items.where(:price => 500..1000).each { |items| p items }

p '*'*45
items.where(:price => 500..1000).order(:date).each { |items| p items }

#filter
#items.filter('price < ?', 100).update(:active => true)
p '*'*45

items.filter(:name => 'cat').each { |items| p items }
p '*'*45

items.filter('price > ?', 100).each { |items| p items }
p '*'*45

items.filter(:price => 100..500).each { |items| p items }
p '*'*45

items.filter(:name.like('c%')).each { |items| p items }
