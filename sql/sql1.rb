require 'sqlite3'

begin
  db = SQLite3::Database.open('test.db')

  id = 1

  inquiry = db.prepare('SELECT * FROM cars WHERE Id=?')
  inquiry.bind_param 1, id

  rs = inquiry.execute
  string = rs.next

  puts string.join("\s")

  inquiry.close
  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

p '*'*30

begin
  db = SQLite3::Database.open('test.db')

  string = db.get_first_row('SELECT * FROM cars WHERE Id=?', 1)
  puts string.join("\s")

  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

p '*'*30

begin
  db = SQLite3::Database.open('test.db')

  value = db.get_first_value("SELECT Price FROM cars WHERE Name=?", 'Audi')
  puts value

  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

p '*'*30

begin
  db = SQLite3::Database.open('test.db')

  inquiry = db.prepare('SELECT * FROM cars LIMIT 5')
  array = inquiry.execute

  array.each { |i| puts i.join("\s") }

  inquiry.close
  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

p '*'*30

begin
  db = SQLite3::Database.open('test.db')

  inquiry = db.prepare('SELECT * FROM cars LIMIT 5')
  array = inquiry.execute

  while (row = array.next) do 
    puts row.join("\s")
  end

  inquiry.close
  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end

p '*'*30

begin
  db = SQLite3::Database.open('test.db')
  db.results_as_hash = true

  array = db.execute('SELECT * FROM cars LIMIT 5')
  
  array.each do |i|
    printf "%s %s %s\n", i['Id'], i['name'], i['price']
  end

  db.close
rescue SQLite3::Exception => e
  p 'Exception occurred'
  p e
end
