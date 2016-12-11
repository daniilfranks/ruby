require 'sqlite3'

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE Authors(
              AuthorId INTEGER PRIMARY KEY, 
              Name TEXT
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE Books(
              BookId INTEGER PRIMARY KEY, 
              Title TEXT, 
              AuthorId INTEGER, 
              FOREIGN KEY(AuthorId) REFERENCES Authors(AuthorId)
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO Authors(Name) VALUES(?)', 'Leo')
  db.execute('INSERT INTO Authors(Name) VALUES(?)', 'Den')
  db.execute('INSERT INTO Authors(Name) VALUES(?)', 'Io')
  db.execute('INSERT INTO Authors(Name) VALUES(?)', 'Ash')
 
  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end


begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO Books(Title, AuthorId) VALUES(?, ?)', 'First book', 1)
  db.execute('INSERT INTO Books(Title, AuthorId) VALUES(?, ?)', 'Second Book', 2)
  db.execute('INSERT INTO Books(Title, AuthorId) VALUES(?, ?)', 'Good book', 1)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.open('test.db')

  string = db.execute('SELECT Name, Title FROM Authors NATURAL JOIN Books')
  p string

  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end
