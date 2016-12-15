require 'sqlite3'
require 'pp'

#DROP
begin
  db = SQLite3::Database.new('test.db')
  db.execute('DROP TABLE customer')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#CREATE TABLE
begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE customer(
              Id INTEGER PRIMARY KEY  NOT NULL,
              cust_code       text    NOT NULL,
              cust_name       text    NOT NULL,
              cust_city       text    NOT NULL,
              working_area    text    NOT NULL,
              cust_country    text    NOT NULL,
              grade           integer NOT NULL,
              opening_amt     integer NOT NULL,
              receive_amt     integer NOT NULL,
              payment_amt     integer NOT NULL,
              outstanding_amt integer NOT NULL,
              phone_no        integer NOT NULL,
              agent_code      text    NOT NULL
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#INSERT
begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO employees(employee_id, first_name, last_name, email, phone_number,
              hire_date, job_id, salary, commission_pct, manager_id, departament_id) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              100, 'Danila', 'Babanov', 'danila_babanov@yahoo.com', 89512345678, 
              '01-09-1994', 'IT_PROG', 5000, '', 1, 90)


  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end