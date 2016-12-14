require 'sqlite3'
require 'pp'

#DROP
begin
  db = SQLite3::Database.new('test.db')
  db.execute('DROP TABLE company')
  db.execute('DROP TABLE orders')
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
              com_id             text(4)  NOT NULL UNIQUE PRIMARY KEY,
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
              ord_id             text(4)  NOT NULL PRIMARY KEY,
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

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE item(
              item_id             text(4)  NOT NULL UNIQUE PRIMARY KEY,
              item_desc           text(20) NOT NULL,
              rate                integer  CHECK (rate > 0 AND rate < 100),
              icom_id              text(4)  NOT NULL,
              FOREIGN KEY(icom_id) REFERENCES company(com_id)
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
  db.execute('INSERT INTO company(com_id, com_name) 
              VALUES(?, ?)', 'Com3', 'ASD INC.')
  db.execute('INSERT INTO company(com_id, com_name) 
              VALUES(?, ?)', 'Com4', 'TSNRU CORP.')
  db.execute('INSERT INTO company(com_id, com_name) 
              VALUES(?, ?)', 'Com5', 'EDIT CORP.')
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

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO item(item_id, item_desc, rate, icom_id) 
              VALUES(?, ?, ?, ?)', 'ITM1', 'Pean-n-Nut', 15, 'Com1')
  db.execute('INSERT INTO item(item_id, item_desc, rate, icom_id) 
              VALUES(?, ?, ?, ?)', 'ITM2', 'Cool Pesta', 10, 'Com2')
  db.execute('INSERT INTO item(item_id, item_desc, rate, icom_id) 
              VALUES(?, ?, ?, ?)', 'ITM3', 'Pena calada', 30, 'Com2')
  db.execute('INSERT INTO item(item_id, item_desc, rate, icom_id) 
              VALUES(?, ?, ?, ?)', 'ITM4', 'B 52', 48, 'Com3')
  db.execute('INSERT INTO item(item_id, item_desc, rate, icom_id) 
              VALUES(?, ?, ?, ?)', 'ITM5', 'ZZZ YA', 51, 'Com4')
  db.execute('INSERT INTO item(item_id, item_desc, rate, icom_id) 
              VALUES(?, ?, ?, ?)', 'ITM6', 'Mini Car', 25, 'Com2')
  db.execute('INSERT INTO item(item_id, item_desc, rate, icom_id) 
              VALUES(?, ?, ?, ?)', 'ITM7', 'Delete Item', 20, 'Com1')
  db.execute('INSERT INTO item(item_id, item_desc, rate, icom_id) 
              VALUES(?, ?, ?, ?)', 'ITM8', 'Edit item', 25, 'Com1')
  db.execute('INSERT INTO item(item_id, item_desc, rate, icom_id) 
              VALUES(?, ?, ?, ?)', 'ITM3', 'Cool Pesta', 110, 'Com1')
  db.execute('INSERT INTO item(item_id, item_desc, rate, icom_id) 
              VALUES(?, ?, ?, ?)', 'ITM4', 'Cool Pesta', 0, 'Com1')
  db.execute('INSERT INTO item(item_id, item_desc, rate, icom_id) 
              VALUES(?, ?, ?, ?)', 'ITM15', 'Tester', 0, 'Com10')

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

pp '*'*50

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM item')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#Update
begin
  db = SQLite3::Database.new('test.db')
  db.execute('UPDATE company SET com_id = ? WHERE com_id = ?', 'Com6', 'Com5')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#Delete
begin
  db = SQLite3::Database.new('test.db')
  db.execute('DELETE FROM company WHERE com_id = ?', 'Com4')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

