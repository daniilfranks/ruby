require 'sqlite3'
require 'pp'

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE peoples(
              Id INTEGER PRIMARY KEY,
              name text UNIQUE NOT NULL,
              age integer,
              city text NOT NULL
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO peoples(name, age, city) VALUES(?, ?, ?)', 'Den', 25, 'Kazan')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO peoples(name, age) VALUES(?, ?)', 'NoOne', 30)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO peoples(name, age, city) VALUES(?, ?, ?)', 'Jok', 35, 'Omsk')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO peoples(name, age, city) VALUES(?, ?, ?)', 'Jok', 35, 'Omsk')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO peoples(age, city) VALUES(?, ?)', 35, 'Omsk')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO peoples(name, age, city) VALUES(?, ?, ?)', 'Zik', 47, 'London')
  db.execute('INSERT INTO peoples(name, age, city) VALUES(?, ?, ?)', 'Ana', 23, 'Manila')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end
