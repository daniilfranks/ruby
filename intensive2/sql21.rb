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
              topic_name text,
              id_author  integer       
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
              name text,
              email text,
              password text     
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
              message text,
              id_author  integer,
              id_topic integer     
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end