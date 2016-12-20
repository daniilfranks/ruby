require 'sqlite3'
require 'pp'

#DROP
begin
  db = SQLite3::Database.new('test.db')
  db.execute('DROP TABLE orders')
  db.execute('DROP TABLE users')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#CREATE TABLE
begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE orders(
              order_id INTEGER PRIMARY KEY,
              user_id varchar(100) NOT NULL,
              order_date  date  NOT NULL    
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#CREATE TABLE
begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE users(
              user_id INTEGER PRIMARY KEY,
              user_name varchar(100) NOT NULL,
              city      varchar(100) NOT NULL    
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#INSERT
begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO orders(user_id, order_date)
              VALUES(?, ?)', 2, '2016-20-12')
  db.execute('INSERT INTO orders(user_id, order_date)
              VALUES(?, ?)', 3, '2016-19-12')
  db.execute('INSERT INTO orders(user_id, order_date)
              VALUES(?, ?)', 1, '2016-18-12')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO users(user_name, city)
              VALUES(?, ?)', 'Den', 'Kazan')
  db.execute('INSERT INTO users(user_name, city)
              VALUES(?, ?)', 'Leo', 'London')
  db.execute('INSERT INTO users(user_name, city)
              VALUES(?, ?)', 'Mark', 'NY')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#SELECT
begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM users')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM orders')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT orders.order_id, users.user_name, orders.order_date
                      FROM orders
                      INNER JOIN users
                      ON orders.user_id = users.user_id')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT users.user_name, orders.order_id
                      FROM users
                      INNER JOIN orders
                      ON users.user_id = orders.user_id
                      ORDER BY users.user_name')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT users.user_name, orders.order_id
                      FROM users
                      LEFT JOIN orders
                      ON users.user_id = orders.user_id
                      ORDER BY users.user_name')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end




