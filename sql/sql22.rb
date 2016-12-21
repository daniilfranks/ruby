require 'sqlite3'
require 'pp'

#ADD COLIMN
begin
  db = SQLite3::Database.new('test.db')
  db.execute('ALTER TABLE users ADD COLUMN role varchar(20)')
  db.execute('ALTER TABLE users ADD COLUMN kol integer(10)')
  db.execute('ALTER TABLE users ADD COLUMN rating varchar(20)')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#SELECT
begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT users.name, topics.topic_name
                      FROM users, topics
                      WHERE users.id_user = topics.id_author')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

p '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT users.name, topics.topic_name
                      FROM users, topics
                      WHERE users.id_user = topics.id_author')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

p '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT users.name, posts.message
                      FROM users, posts
                      WHERE users.id_user = posts.id_author')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

p '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM posts')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

p '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT COUNT(id_topic) FROM posts')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

p '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT id_topic, COUNT(id_topic) FROM posts
                      GROUP BY id_topic')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

p '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT id_topic, COUNT(id_topic) FROM posts
                      GROUP BY id_topic
                      HAVING COUNT(id_topic) > ?', 1)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#UPDATE
begin
  db = SQLite3::Database.new('test.db')
  db.execute('UPDATE users SET role = ?', 1)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('UPDATE users SET kol = ?', 0)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('UPDATE users SET rating = ?', 0)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('UPDATE users SET role = ? WHERE id_user = ?', 3, 1)
  db.execute('UPDATE users SET kol = ? WHERE id_user = ?', 50, 1)

  db.execute('UPDATE users SET kol = ? WHERE id_user = ?', 50, 2)
  db.execute('UPDATE users SET kol = ? WHERE id_user = ?', 40, 3)
  db.execute('UPDATE users SET kol = ? WHERE id_user = ?', 30, 4)
  db.execute('UPDATE users SET kol = ? WHERE id_user = ?', 20, 5)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('UPDATE users SET rating = ?', 0)
  db.execute('UPDATE users SET rating = ? WHERE id_user = ?', 50, 1)
  db.execute('UPDATE users SET rating = ? WHERE kol <= ?', 10, 30)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('DELETE FROM posts WHERE id_author = ?', 2)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

