require 'sqlite3'

begin
  db = SQLite3::Database.open('test.db')

  inquiry = db.prepare('SELECT * FROM cars LIMIT 5')
  array = inquiry.execute

  array.each { |i| puts i.join("\s") }
  
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end