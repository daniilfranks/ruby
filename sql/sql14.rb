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
  db.execute('DROP TABLE departament')

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
              name               text    NOT NULL UNIQUE,
              age                integer NOT NULL DEFAULT 0,
              city               text    NOT NULL,
              salary             integer NOT NULL CHECK(salary > 0) 
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE departament(
              Id INTEGER PRIMARY KEY     NOT NULL,
              dept               text    NOT NULL,
              emp_id             integer NOT NULL
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

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO departament(dept, emp_id) 
              VALUES(?, ?)', 'It Biling', 1)
  db.execute('INSERT INTO departament(dept, emp_id) 
              VALUES(?, ?)', 'Engineerig', 2)
  db.execute('INSERT INTO departament(dept, emp_id) 
              VALUES(?, ?)', 'Finance', 4)
  db.execute('INSERT INTO departament(dept, emp_id) 
              VALUES(?, ?)', 'Engineerig', 7)
  db.execute('INSERT INTO departament(dept, emp_id) 
              VALUES(?, ?)', 'Finance', 5)
  db.execute('INSERT INTO departament(dept, emp_id) 
              VALUES(?, ?)', 'Engineerig', 6)
  db.execute('INSERT INTO departament(dept, emp_id) 
              VALUES(?, ?)', 'Engineerig', 3)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#SELECT JOIN
begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT emp_id, name, dept FROM company JOIN departament
                      ON company.id = departament.emp_id')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT emp_id, name, dept FROM company LEFT OUTER JOIN departament
                      ON company.id = departament.emp_id')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end
