require 'sqlite3'
require 'pp'

#DROP
begin
  db = SQLite3::Database.new('test.db')
  db.execute('DROP TABLE books')
  db.execute('DROP TABLE auth')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#CREATE TABLE
begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE auth(
              auth_id INTEGER PRIMARY KEY,
              name varchar(100) NOT NULL,
              age  integer CHECK(age > 16)
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE books(
              book_id INTEGER PRIMARY KEY,
              title      text    NOT NULL,
              count_page integer NOT NULL CHECK(count_page > 0),
              price      real    CHECK(price > 0),
              auth_id    integer,
              FOREIGN KEY(auth_id) REFERENCES auth(auth_id)  
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end


#INSERT
begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO auth(name, age)
              VALUES(?, ?)', 'Den', 25)
  db.execute('INSERT INTO auth(name, age)
              VALUES(?, ?)', 'Leo', 31)
  db.execute('INSERT INTO auth(name, age)
              VALUES(?, ?)', 'Jok', 19)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO books(title, count_page, price, auth_id)
              VALUES(?, ?, ?, ?)', 'Book 1', 215, 30, 1)
  db.execute('INSERT INTO books(title, count_page, price, auth_id)
              VALUES(?, ?, ?, ?)', 'Book 2', 345, 18, 1)
  db.execute('INSERT INTO books(title, count_page, price, auth_id)
              VALUES(?, ?, ?, ?)', 'Book 3', 120, 15, 2)
  db.execute('INSERT INTO books(title, count_page, price, auth_id)
              VALUES(?, ?, ?, ?)', 'Book 4', 156, 23, 3)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO auth(name, age)
              VALUES(?, ?)', 'Glen', 10)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute("PRAGMA foreign_keys = ON")
  db.execute('INSERT INTO books(title, count_page, price, auth_id)
              VALUES(?, ?, ?, ?)', 'Book 5', 200, 50, 5)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute("PRAGMA foreign_keys = ON")
  db.execute('UPDATE books SET auth_id = ? WHERE title = ?', 5, 'Book 4')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute("PRAGMA foreign_keys = ON")
  db.execute('DELETE FROM auth WHERE name = ?', 'Leo')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end
