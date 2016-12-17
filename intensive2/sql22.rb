require 'sqlite3'
require 'pp'

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

