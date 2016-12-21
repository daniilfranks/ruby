require 'sqlite3'
require 'pp'

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE IF NOT EXISTS Customers(
             CustomerId INTEGER PRIMARY KEY,
             Name text
            )')

  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO Customers(Name) VALUES(?)', 'Den')
  db.execute('INSERT INTO Customers(Name) VALUES(?)', 'Leo')
  db.execute('INSERT INTO Customers(Name) VALUES(?)', 'Io')
  db.execute('INSERT INTO Customers(Name) VALUES(?)', 'Jok')
  
  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE IF NOT EXISTS Reservations(
             Id INTEGER PRIMARY KEY,
             CustomerId integer,
             Day text
            )')

  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO Reservations(CustomerId, Day) VALUES(?, ?)', 1, '2016-30-11')
  db.execute('INSERT INTO Reservations(CustomerId, Day) VALUES(?, ?)', 2, '2016-18-03')
  db.execute('INSERT INTO Reservations(CustomerId, Day) VALUES(?, ?)', 2, '2016-27-09')
  db.execute('INSERT INTO Reservations(CustomerId, Day) VALUES(?, ?)', 1, '2016-01-12')
  
  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM Customers')
  pp array
 
  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM Reservations')
  pp array
 
  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT Name, Day FROM Customers NATURAL JOIN Reservations')
  pp array
 
  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT Name, Day FROM Customers CROSS JOIN Reservations')
  pp array
 
  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end
