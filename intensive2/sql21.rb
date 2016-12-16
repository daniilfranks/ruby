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

