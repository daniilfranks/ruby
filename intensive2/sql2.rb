require 'sqlite3'

begin
  db = SQLite3::Database.new('test.db')

  name = 'Skoda'

  stm = db.prepare('SELECT * FROM cars WHERE name = ?')
  stm.bind_param 1, name
  rs = stm.execute

  row = rs.next
  puts row.join("\s")

  stm.close
  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')

  id = 3

  stm = db.prepare('SELECT * FROM cars WHERE Id = :id')
  rs = stm.execute id

  row = rs.next
  puts row.join("\s")

  stm.close
  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')

  id = 2
  row = db.get_first_row('SELECT * FROM cars WHERE Id = ?', id)
  puts row.join("\s")

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end
