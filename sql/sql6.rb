require 'sqlite3'
require 'pp'

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE Orders(
             id INTEGER PRIMARY KEY,
             OrderPrice INTEGER CHECK(OrderPrice > 0),
             Customer text 
            )')

  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO Orders(OrderPrice, Customer) VALUES(?, ?)', 1200, 'Brown')
  db.execute('INSERT INTO Orders(OrderPrice, Customer) VALUES(?, ?)', 10, 'Black')
  db.execute('INSERT INTO Orders(OrderPrice, Customer) VALUES(?, ?)', 0, 'Red')
  db.execute('INSERT INTO Orders(OrderPrice, Customer) VALUES(?, ?)', -1000, 'Ice')
  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end
