require 'sqlite3'
require 'pp'

#DROP
begin
  db = SQLite3::Database.new('test.db')
  db.execute('DROP TABLE topics')
  db.execute('DROP TABLE users')
  db.execute('DROP TABLE posts')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#CREATE TABLE
begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE topics(
              id_topic INTEGER PRIMARY KEY,
              topic_name varchar(100) NOT NULL,
              id_author  integer(10)  NOT NULL,  
              FOREIGN KEY(id_author) REFERENCES users(id_user)     
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE users(
              id_user INTEGER PRIMARY KEY,
              name     varchar(20) NOT NULL,
              email    varchar(50) NOT NULL,
              password varchar(20) NOT NULL    
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE posts(
              id_post INTEGER PRIMARY KEY,
              message   text        NOT NULL,
              id_author integer(10) NOT NULL,
              id_topic  integer(10) NOT NULL,
              FOREIGN KEY(id_author) REFERENCES users(id_user),
              FOREIGN KEY(id_topic) REFERENCES topics(id_topic)     
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#INSERT
begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO users(name, email, password)
              VALUES(?, ?, ?)', 'Den', 'danila_babanov@yahoo.com', '12345')
  db.execute('INSERT INTO users(name, email, password)
              VALUES(?, ?, ?)', 'Leo', 'leo@gmail.com', '5562314')
  db.execute('INSERT INTO users(name, email, password)
              VALUES(?, ?, ?)', 'Jok', 'jok322@yahoo.com', '97523932')
  db.execute('INSERT INTO users(name, email, password)
              VALUES(?, ?, ?)', 'Byblik', 'byblik@rambler.com', '18349640')
  db.execute('INSERT INTO users(name, email, password)
              VALUES(?, ?, ?)', 'Filip', 'filip12345@gmail.com', '38586329')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO topics(topic_name, id_author)
              VALUES(?, ?)', 'first', 1)
  db.execute('INSERT INTO topics(topic_name, id_author)
              VALUES(?, ?)', 'php', 2)
  db.execute('INSERT INTO topics(topic_name, id_author)
              VALUES(?, ?)', 'ruby', 1)
  db.execute('INSERT INTO topics(topic_name, id_author)
              VALUES(?, ?)', 'C++', 2)
  db.execute('INSERT INTO topics(topic_name, id_author)
              VALUES(?, ?)', 'Ruby on Rails', 3)
  
  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO posts(message, id_author, id_topic)
              VALUES(?, ?, ?)', 'First post', 1, 1)
  db.execute('INSERT INTO posts(message, id_author, id_topic)
              VALUES(?, ?, ?)', 'Text php', 1, 2)
  db.execute('INSERT INTO posts(message, id_author, id_topic)
              VALUES(?, ?, ?)', 'Text text ruby', 2, 3)
  db.execute('INSERT INTO posts(message, id_author, id_topic)
              VALUES(?, ?, ?)', 'Rails post', 3, 4)
  db.execute('INSERT INTO posts(message, id_author, id_topic)
              VALUES(?, ?, ?)', 'Text Sinatra', 4, 5)
  
  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#SELECT
begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM users')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT name, email FROM users')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM posts')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM topics ORDER BY topic_name')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end


begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM topics ORDER BY topic_name DESC')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM topics ORDER BY topic_name DESC, id_author DESC')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM topics WHERE id_author = ?', 1)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM topics WHERE topic_name = ?', 'Ruby on Rails')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM topics WHERE id_author > ?', 1)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM topics WHERE id_author IS NOT NULL')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM topics WHERE id_topic BETWEEN ? AND ?', 1, 3)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM topics WHERE id_topic IN(?, ?)', 1, 3)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM topics WHERE id_topic NOT IN(?, ?)', 1, 3)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM topics WHERE topic_name LIKE ?', 'ru%')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM topics WHERE topic_name NOT LIKE ?', 'ru%')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM topics WHERE topic_name LIKE ?', '%i%')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT name FROM users WHERE id_user = ?', 1)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT name FROM users WHERE id_user IN
                      (SELECT id_author FROM topics WHERE topic_name = ?)', 'C++')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT message FROM posts WHERE id_author IN
                      (SELECT id_author FROM topics WHERE topic_name = ?)', 'ruby')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT topic_name, name FROM topics, users 
                      WHERE topics.id_author = users.id_user')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT posts.message, topics.topic_name, users.name
                      FROM posts, topics, users 
                      WHERE posts.id_author = users.id_user
                      AND posts.id_topic = topics.id_topic')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end
