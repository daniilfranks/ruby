require 'sqlite3'
require 'pp'

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE users(
              UserId INTEGER PRIMARY KEY,
              name text,
              date datetime
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE cars(
              CarId INTEGER PRIMARY KEY,
              model text,
              price integer,
              UserId integer,
              FOREIGN KEY(UserId) REFERENCES users(UserId)
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

=begin
begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO users(name, date) VALUES(?, ?)', 'Leo', '30-12-2016 16:10')
  db.execute('INSERT INTO users(name, date) VALUES(?, ?)', 'Den', '01-09-2016 12:00')
  db.execute('INSERT INTO users(name, date) VALUES(?, ?)', 'Io', '28-02-2015 18:35')
  db.execute('INSERT INTO users(name, date) VALUES(?, ?)', 'Ash', '12-06-2014 12:55')
  db.execute('INSERT INTO users(name, date) VALUES(?, ?)', 'Bart', '21-11-2016 02:47')
  db.execute('INSERT INTO users(name, date) VALUES(?, ?)', 'Klark', '04-04-2015 21:32')
  db.execute('INSERT INTO users(name, date) VALUES(?, ?)', 'Teodor', '19-06-2016 18:44')
  db.execute('INSERT INTO users(name, date) VALUES(?, ?)', 'Mike', '09-03-2015 07:21')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end


begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO cars(model, price, UserId) VALUES(?, ?, ?)', 'Audi', 20000, 1)
  db.execute('INSERT INTO cars(model, price, UserId) VALUES(?, ?, ?)', 'Mercedes', 35000, 2)
  db.execute('INSERT INTO cars(model, price, UserId) VALUES(?, ?, ?)', 'Skoda', 12000, 1)
  db.execute('INSERT INTO cars(model, price, UserId) VALUES(?, ?, ?)', 'Volvo', 27000, 3)
  db.execute('INSERT INTO cars(model, price, UserId) VALUES(?, ?, ?)', 'Hummer', 54999, 4)
  db.execute('INSERT INTO cars(model, price, UserId) VALUES(?, ?, ?)', 'Citroen', 8000, 2)
  db.execute('INSERT INTO cars(model, price, UserId) VALUES(?, ?, ?)', 'Lada', 5000, 5)
  db.execute('INSERT INTO cars(model, price, UserId) VALUES(?, ?, ?)', 'Mazda', 14500, 6)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

=end

begin
  db = SQLite3::Database.open('test.db')

  string = db.execute('SELECT name, model FROM users NATURAL JOIN cars')
  pp string

  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

begin
  db = SQLite3::Database.open('test.db')

  string = db.execute('SELECT * FROM cars')
  pp string

  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

begin
  db = SQLite3::Database.open('test.db')

  string = db.execute('SELECT * FROM cars WHERE UserId = ?', 1)
  pp string

  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

begin
  db = SQLite3::Database.open('test.db')

  string = db.execute('SELECT * FROM users WHERE UserId = ?', 1)
  pp string

  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

begin
  db = SQLite3::Database.open('test.db')

  string = db.execute('SELECT * FROM cars WHERE CarId = ?', 1)
  pp string

  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

begin
  db = SQLite3::Database.open('test.db')

  string = db.execute('SELECT * FROM cars LIMIT 5')
  pp string

  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end
