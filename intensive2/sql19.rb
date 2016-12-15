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
  db.execute('INSERT INTO customer(cust_code, cust_name, cust_city, working_area, cust_country,
              grade, opening_amt, receive_amt, payment_amt, outstanding_amt, phone_no, agent_code) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              'C00001', 'Danila', 'Kazan', 'Kazan', 'RUS', 1, 
              6000.00, 5000.00, 7000.00, 4000.00, 89501234567, 'A001')
  db.execute('INSERT INTO customer(cust_code, cust_name, cust_city, working_area, cust_country,
              grade, opening_amt, receive_amt, payment_amt, outstanding_amt, phone_no, agent_code) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              'C00012', 'Holmes', 'London', 'London', 'UK', 2,
              4000.00, 6000.00, 5000.00, 7000.00, 30915891245, 'A021')
  db.execute('INSERT INTO customer(cust_code, cust_name, cust_city, working_area, cust_country,
              grade, opening_amt, receive_amt, payment_amt, outstanding_amt, phone_no, agent_code) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              'C00013', 'Albert', 'NY', 'NY', 'USA', 3, 
              3500.00, 6400.00, 3000.00, 5000.00, 11905418923, 'A021')
  db.execute('INSERT INTO customer(cust_code, cust_name, cust_city, working_area, cust_country,
              grade, opening_amt, receive_amt, payment_amt, outstanding_amt, phone_no, agent_code) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              'C00011', 'Micheal', 'NY', 'NY', 'USA', 3, 
              7300.00, 3000.00, 4500.00, 6000.00, 38192134556, 'A002')
  db.execute('INSERT INTO customer(cust_code, cust_name, cust_city, working_area, cust_country,
              grade, opening_amt, receive_amt, payment_amt, outstanding_amt, phone_no, agent_code) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              'C0008', 'Ravindram', 'Bangalore', 'Bangalore', 'India', 4, 
              8000.00, 4500.00, 3300.00, 6200.00, 88134356769, 'A004')
  db.execute('INSERT INTO customer(cust_code, cust_name, cust_city, working_area, cust_country,
              grade, opening_amt, receive_amt, payment_amt, outstanding_amt, phone_no, agent_code) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              'C00322', 'Leon', 'Kazan', 'Kazan', 'RUS', 1, 
              7500.00, 2000.00, 4300.00, 6400.00, 89500032211, 'A001')
  db.execute('INSERT INTO customer(cust_code, cust_name, cust_city, working_area, cust_country,
              grade, opening_amt, receive_amt, payment_amt, outstanding_amt, phone_no, agent_code) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              'C00014', 'Jacks', 'Brisban', 'Brisban', 'Australia', 5, 
              3400.00, 2100.00, 1800.00, 5500.00, 54865828477, 'A011')
  db.execute('INSERT INTO customer(cust_code, cust_name, cust_city, working_area, cust_country,
              grade, opening_amt, receive_amt, payment_amt, outstanding_amt, phone_no, agent_code) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              'C00088', 'Fleming', 'Brisban', 'Brisban', 'Australia', 5, 
              5900.00, 3000.00, 8000.00, 2000.00, 54878239483, 'A011')
  db.execute('INSERT INTO customer(cust_code, cust_name, cust_city, working_area, cust_country,
              grade, opening_amt, receive_amt, payment_amt, outstanding_amt, phone_no, agent_code) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              'C00111', 'Martin', 'Toronto', 'Toronto', 'Canada', 3, 
              1800.00, 5000.00, 3400.00, 2900.00, 93885685486, 'A031')
  db.execute('INSERT INTO customer(cust_code, cust_name, cust_city, working_area, cust_country,
              grade, opening_amt, receive_amt, payment_amt, outstanding_amt, phone_no, agent_code) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              'C00013', 'Karolina', 'Toronto', 'Toronto', 'Canada', 1, 
              9000.00, 4500.00, 3200.00, 2100.00, 586478934435, 'A021')


  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#SELECT
begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT cust_name, opening_amt, receive_amt,(opening_amt + receive_amt) 
                      FROM customer
                      WHERE (opening_amt + receive_amt) > ?', 10000)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT cust_name, opening_amt, outstanding_amt
                      FROM customer
                      WHERE (opening_amt - receive_amt) = receive_amt')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end