require 'sqlite3'

begin
  db = SQLite3::Database.new('test.db')
  db.execute("CREATE TABLE users(
              id INTEGER PRIMARY KEY,
              name text UNIQUE NOT NULL,
              sex text CHECK(sex IN ('M', 'F'))
            )")

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO users(name, sex) VALUES(?, ?)', 'Leo', 'M')
  db.execute('INSERT INTO users(name, sex) VALUES(?, ?)', 'Io', 'visp')
  db.execute('INSERT INTO users(name, sex) VALUES(?, ?)', 'Leo', 'M')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.open('test.db')

  string = db.get_first_row('SELECT * FROM users WHERE name= ?', 'Leo')
  puts string.join("\s")

  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

