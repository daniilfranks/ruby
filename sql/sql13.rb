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

#CREATE
begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE company(
              Id INTEGER PRIMARY KEY     NOT NULL,
              name               text    NOT NULL,
              age                integer NOT NULL,
              city               text    NOT NULL,
              salary             integer NOT NULL 
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#INSERT
begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO company(name, age, city, salary) 
              VALUES(?, ?, ?, ?)', 'Den', 25, 'Kazan', 5000)
  db.execute('INSERT INTO company(name, age, city, salary) 
              VALUES(?, ?, ?, ?)', 'Jok', 19, 'London', 3500)
  db.execute('INSERT INTO company(name, age, city, salary) 
              VALUES(?, ?, ?, ?)', 'Vladlen', 21, 'Bratislava', 4000)
  db.execute('INSERT INTO company(name, age, city, salary) 
              VALUES(?, ?, ?, ?)', 'Johanson', 29, 'Oslo', 7000)
  db.execute('INSERT INTO company(name, age, city, salary) 
              VALUES(?, ?, ?, ?)', 'Glen', 35, 'NY', 9000)
  db.execute('INSERT INTO company(name, age, city, salary) 
              VALUES(?, ?, ?, ?)', 'Ash', 28, 'NY', 7400)
  db.execute('INSERT INTO company(name, age, city, salary) 
              VALUES(?, ?, ?, ?)', 'Bag', 99, 'NY', 80000)

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

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT name FROM company')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT age FROM company')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT city FROM company')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT salary FROM company')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company WHERE name = ?', 'Den')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company WHERE city = ?', 'NY')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company WHERE age >= ?', 25)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company WHERE age >= ? AND salary >= ?', 25, 7200)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company WHERE age IS NOT NULL')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company WHERE name LIKE ?', 'Jo%')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#Range
begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company WHERE age IN(?, ?)', 25, 35)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company WHERE age NOT IN(?, ?)', 25, 35)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company WHERE age BETWEEN ? AND ?', 25, 35)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#UPDATE
begin
  db = SQLite3::Database.new('test.db')
  db.execute('UPDATE company SET city = ? WHERE Id = ?', 'Delover', 5)

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

begin
  db = SQLite3::Database.new('test.db')
  db.execute('UPDATE company SET city = ?, salary = ? WHERE Id = ?', 'Toronto', 10000, 6)

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

#Delete
begin
  db = SQLite3::Database.new('test.db')
  db.execute('DELETE FROM company WHERE Id = ?', 7)

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

#Limit

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company LIMIT 3')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company LIMIT 3 OFFSET 2')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#Order
begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company ORDER BY salary ASC')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company ORDER BY age ASC')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company ORDER BY salary DESC')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company ORDER BY age DESC')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company ORDER BY name ASC')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM company ORDER BY name DESC')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#GROUP BY
begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT name, salary FROM company GROUP BY name')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT name, city FROM company GROUP BY name')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT name, age FROM company GROUP BY name ORDER BY name DESC')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT name, age FROM company GROUP BY name ORDER BY age DESC')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT name, age FROM company GROUP BY name ORDER BY age ASC')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end