require 'sqlite3'
require 'pp'

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE cars(
              Id INTEGER PRIMARY KEY,
              model text,
              price integer
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Audi', 20000)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Mercedes', 35000)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Skoda', 12000)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Volvo', 27000)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Hummer', 54999)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Citroen', 8000)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Lada', 5000)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Mazda', 14500)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM cars')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute("SELECT * FROM cars WHERE model IN ('Lada', 'Skoda')")
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute("SELECT * FROM cars WHERE model LIKE 'M%' ")
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute("SELECT * FROM cars WHERE price BETWEEN 10000 AND 20000 ")
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end
