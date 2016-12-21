require 'pp'
require "sqlite3"

#db = SQLite3::Database.new "test.db"

#create table
#sql = <<-SQL
#  CREATE TABLE users (
#    id integer primary key,
#    name text
#  );
#SQL

#create table
#db.execute(sql)

#insert
#db.execute('INSERT INTO users(name) VALUES(?)', 'Leo')
#db.execute('INSERT INTO users(name) VALUES(?)', 'Mark')

# select
#db.execute('SELECT * FROM users') do |row|
#  p row
#end

#rows = db.execute('SELECT * FROM users')


#db.close

db = SQLite3::Database.open('test.db')
#db.execute('INSERT INTO users(name) VALUES(?)', 'Danila')
#db.close

users = db.execute('SELECT * FROM users')
pp users[0..4]


begin
  db = SQLite3::Database.open('test.db')

  db.execute(
            'CREATE TABLE cars(
            Id INTEGER PRIMARY KEY,
            name text,
            price integer
            )')

  db.close
rescue SQLite3::Exception => e
  pp 'Exception occurred'
  pp e
end


#db.execute('INSERT INTO cars(name, price) VALUES(?, ?)', 'Audi', 25000)
#db.execute('INSERT INTO cars(name, price) VALUES(?, ?)', 'Mercedes', 31000)
#db.execute('INSERT INTO cars(name, price) VALUES(?, ?)', 'Skoda', 12000)

cars = db.execute('SELECT * FROM cars')
pp cars[0..4]