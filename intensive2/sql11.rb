require 'sqlite3'
require 'pp'

begin
  db = SQLite3::Database.new('test.db')
  db.execute("CREATE TABLE orders(
              Id INTEGER PRIMARY KEY,
              item text,
              price integer,
              quantity integer
            )")

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO orders(item, price, quantity) VALUES(?, ?, ?)', 'Black', 50, 1)
  db.execute('INSERT INTO orders(item, price, quantity) VALUES(?, ?, ?)', 'Black', 10, 1)
  db.execute('INSERT INTO orders(item, price, quantity) VALUES(?, ?, ?)', 'Brown', 20, 1)
  db.execute('INSERT INTO orders(item, price, quantity) VALUES(?, ?, ?)', 'Red', 35, 1)
  db.execute('INSERT INTO orders(item, price, quantity) VALUES(?, ?, ?)', 'Brown', 80, 1)
  db.execute('INSERT INTO orders(item, price, quantity) VALUES(?, ?, ?)', 'Brown', 20, 1)
  db.execute('INSERT INTO orders(item, price, quantity) VALUES(?, ?, ?)', 'Car', 100, 1)
  db.execute('INSERT INTO orders(item, price, quantity) VALUES(?, ?, ?)', 'Dog', 300, 1)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM orders WHERE Id = ?', 5)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM orders WHERE item = ?', 'Brown')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM orders WHERE item LIKE ?', 'B%')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT item FROM orders WHERE item LIKE ?', 'B%')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT sum(price) AS Total, sum(quantity) AS Quantity, item FROM orders GROUP BY item')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT sum(price) AS Total, sum(quantity) AS Quantity, 
    item FROM orders GROUP BY item HAVING sum(price) > 100')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end
