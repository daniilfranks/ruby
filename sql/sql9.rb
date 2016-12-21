require 'sqlite3'
require 'pp'

begin
  db = SQLite3::Database.new('test.db')
  db.execute("CREATE TABLE cars(
              Id INTEGER PRIMARY KEY,
              model text DEFAULT 'Not available',
              price integer DEFAULT 0
            )")

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Audi', 20000)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Mercedes', 35000)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Delete', 100000)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Skoda', 12000)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Skoda', 12000)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Volvo', 27000)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Hummer', 54999)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Citroen', 8000)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Lada', 5000)
  db.execute('INSERT INTO cars(model, price) VALUES(?, ?)', 'Mazda', 14500)
  db.execute('INSERT INTO cars(model) VALUES(?)', 'Fiat')
  db.execute('INSERT INTO cars(price) VALUES(?)', 100)
  db.execute('INSERT INTO cars(id) VALUES(?)')
  db.execute('INSERT OR FAIL INTO cars(Id, model, price) VALUES(?, ?, ?)', 8, 'Mazda', 14500)
  db.execute('INSERT OR IGNORE INTO cars(Id, model, price) VALUES(?, ?, ?)', 8, 'Mazda', 14500)

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
  array = db.execute('SELECT * FROM cars WHERE id = ?', 5 )
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM cars WHERE model = ?', 'Lada')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('DELETE FROM cars WHERE id = ?', 1)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('DELETE FROM cars WHERE model = ?', 'Delete')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('UPDATE cars SET model = ?, price = ? WHERE Id = ?', 'Skoda Fabia', 9888, 4 )

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end
