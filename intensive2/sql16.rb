require 'sqlite3'
require 'pp'

#DROP
begin
  db = SQLite3::Database.new('test.db')
  db.execute('DROP TABLE locations')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#CREATE TABLE
begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE locations(
              Id INTEGER PRIMARY KEY NOT NULL,
              location_id    integer NOT NULL,
              street_address text    NOT NULL,
              postal_code    integer NOT NULL,
              city           text    NOT NULL,
              state_province text    NOT NULL,
              country_id     text    NOT NULL
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts es
end

#INSERT
begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO locations(location_id, street_address, postal_code, city, state_province, country_id) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              1000, '2017 Shinjuku', 1689, 'Tokyo', 'Tokyo Prefectu', 'JP')
  db.execute('INSERT INTO locations(location_id, street_address, postal_code, city, state_province, country_id) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              2000, '2014 Jabberwoc', 26192, 'Southlake', 'Texas', 'US')
  db.execute('INSERT INTO locations(location_id, street_address, postal_code, city, state_province, country_id) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              3000, '2011 Interiors', 99236, 'South San', 'California', 'US')
  db.execute('INSERT INTO locations(location_id, street_address, postal_code, city, state_province, country_id) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              4000, '2004 Charade R', 98199, 'Seattle', 'Washington', 'US')
  db.execute('INSERT INTO locations(location_id, street_address, postal_code, city, state_province, country_id) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              5000, '147 Spadina Av', 190518, 'Toronto', 'Ontario', 'CA')
  db.execute('INSERT INTO locations(location_id, street_address, postal_code, city, state_province, country_id) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              6000, '12-98 Victoria', 2901, 'Sydney', 'New South Wale', 'AU')
  db.execute('INSERT INTO locations(location_id, street_address, postal_code, city, state_province, country_id) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              7000, 'Magdalen Centr', 80925, 'Munich', 'Bavaria', 'DE')
  db.execute('INSERT INTO locations(location_id, street_address, postal_code, city, state_province, country_id) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              8000, '9702 Chester R', 1730, 'Stretford', 'Manchester', 'UK')
  db.execute('INSERT INTO locations(location_id, street_address, postal_code, city, state_province, country_id) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              9000, 'Pieter Breughe', 3095, 'Utrecht', 'Utrecht', 'NL')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#SELECT
begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM locations')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT street_address, city FROM locations')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM locations LIMIT 5')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM locations LIMIT 3,5')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM locations LIMIT 5 OFFSET 3')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM locations WHERE country_id = ?', 'US')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

