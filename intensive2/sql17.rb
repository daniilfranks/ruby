require 'sqlite3'
require 'pp'

#DROP
begin
  db = SQLite3::Database.new('test.db')
  db.execute('DROP TABLE agents')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#CREATE TABLE
begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE agents(
              Id INTEGER PRIMARY KEY NOT NULL,
              agent_code     text    NOT NULL,
              agent_names    text    NOT NULL,
              working_area   text    NOT NULL,
              commission     integer NOT NULL,
              phone_no       decimal(12,0) NOT NULL,
              country        text    
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts es
end

#INSERT
begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO agents(agent_code, agent_names, working_area, commission, phone_no, country) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              'A001', 'Alex', 'London', 0.13, 7512345678, '')
  db.execute('INSERT INTO agents(agent_code, agent_names, working_area, commission, phone_no, country) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              'A002', 'Den', 'Kazan', 0.15, 723456789, '')
  db.execute('INSERT INTO agents(agent_code, agent_names, working_area, commission, phone_no, country) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              'A003', 'Ivan', 'Omsk', 0.11, 798765432, '')
  db.execute('INSERT INTO agents(agent_code, agent_names, working_area, commission, phone_no, country) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              'A004', 'Benjamin', 'Toronto', 0.12, 7512345678, '')
  db.execute('INSERT INTO agents(agent_code, agent_names, working_area, commission, phone_no, country) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              'A005', 'Anderson', 'Mubai', 0.17, 1412345678, '')
  db.execute('INSERT INTO agents(agent_code, agent_names, working_area, commission, phone_no, country) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              'A006', 'Jok', 'Madrid', 0.14, 412348688, '')
  db.execute('INSERT INTO agents(agent_code, agent_names, working_area, commission, phone_no, country) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              'A007', 'Mikl', 'Oslo', 0.10, 59084545678, '')
  db.execute('INSERT INTO agents(agent_code, agent_names, working_area, commission, phone_no, country) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              'A008', 'Numo', 'Lisabon', 0.08, 987325678, '')
  db.execute('INSERT INTO agents(agent_code, agent_names, working_area, commission, phone_no, country) 
              VALUES(?, ?, ?, ?, ?, ?)', 
              'A009', 'Amsterdam', 'Van Rol', 0.20, 7322340678, '')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#SELECT
begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM agents')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM agents WHERE commission > ?', '.13')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT agent_code, agent_names, commission 
                      FROM agents WHERE commission > ?', '.13')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

p '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT agent_names, working_area, (commission * 2)
                      FROM agents
                      WHERE (commission * 2) > ?', 0.25)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

p '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT agent_code, agent_names, commission
                      FROM agents
                      WHERE commission = ?', 0.15)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

p '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT agent_code, agent_names, commission
                      FROM agents
                      WHERE commission > ?', 0.14)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

p '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT agent_code, agent_names, commission
                      FROM agents
                      WHERE commission < ?', 0.15)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

p '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT agent_code, agent_names, commission
                      FROM agents
                      WHERE commission BETWEEN ? AND ?', 0.12, 0.14)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

