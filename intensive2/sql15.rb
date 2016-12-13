require 'sqlite3'
require 'pp'

#DROP
begin
  db = SQLite3::Database.new('test.db')
  db.execute('DROP TABLE company')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('DROP TABLE orders')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('DROP TABLE item')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#CREATE
begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE company(
              Id INTEGER PRIMARY KEY,
              com_id             text(4)  NOT NULL UNIQUE,
              com_name           text(15) NOT NULL UNIQUE
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE orders(
              Id INTEGER PRIMARY KEY,
              ord_id             text(4)  NOT NULL,
              item_id            text(4)  NOT NULL UNIQUE,
              ord_date           date     NOT NULL UNIQUE,
              ord_qty            integer  NOT NULL,
              cost               integer  NOT NULL
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#INSERT
begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO company(com_id, com_name) 
              VALUES(?, ?)', 'Com1', 'DEN BOB LTD.')
  db.execute('INSERT INTO company(com_id, com_name) 
              VALUES(?, ?)', 'Com2', 'DELTA UA LTD.')
  db.execute('INSERT INTO company(com_id) 
              VALUES(?)', 'Com2')
  db.execute('INSERT INTO company(com_id) 
              VALUES(?, ?)', 'Com2', NULL)
  db.execute('INSERT INTO company(com_id, com_name) 
              VALUES(?, ?)', 'Com1', 'DEN BOB LTD.')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO orders(ord_id, item_id, ord_date, ord_qty, cost) 
              VALUES(?, ?, ?, ?, ?)', 'ORD1', 'ITM1', '13,12,2016', 10, 300)
  db.execute('INSERT INTO orders(ord_id, item_id, ord_date, ord_qty, cost) 
              VALUES(?, ?, ?, ?, ?)', 'ORD2', 'ITM2', '21,09,2016', 12, 300)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#SELECT
begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*50

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM orders')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end