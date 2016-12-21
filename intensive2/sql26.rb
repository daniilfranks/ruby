require 'sqlite3'
require 'pp'

#DROP
begin
  db = SQLite3::Database.new('test.db')
  db.execute('DROP TABLE books')
  db.execute('DROP TABLE auth')
  db.execute('DROP TABLE auth_book')

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
              price      real    CHECK(price > 0)
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE auth_book(
              auth_id INTEGER NOT NULL,
              book_id INTEGER NOT NULL,
              FOREIGN KEY(auth_id) REFERENCES auth(auth_id), 
              FOREIGN KEY(book_id) REFERENCES books(book_id)
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
  db.execute('INSERT INTO books(title, count_page, price)
              VALUES(?, ?, ?)', 'Book 1', 215, 30)
  db.execute('INSERT INTO books(title, count_page, price)
              VALUES(?, ?, ?)', 'Book 2', 345, 18)
  db.execute('INSERT INTO books(title, count_page, price)
              VALUES(?, ?, ?)', 'Book 3', 120, 15)
  db.execute('INSERT INTO books(title, count_page, price)
              VALUES(?, ?, ?)', 'Book 4', 156, 23)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO auth_book(auth_id, book_id)
              VALUES(?, ?)', 1, 1 )
  db.execute('INSERT INTO auth_book(auth_id, book_id)
              VALUES(?, ?)', 2, 2 )
  db.execute('INSERT INTO auth_book(auth_id, book_id)
              VALUES(?, ?)', 3, 3 )
  db.execute('INSERT INTO auth_book(auth_id, book_id)
              VALUES(?, ?)', 4, 3 )

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute("PRAGMA foreign_keys = ON")
  db.execute('INSERT INTO auth_book(auth_id, book_id)
              VALUES(?, ?)', 5, 5 )

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end
