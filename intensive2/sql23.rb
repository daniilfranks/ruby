require 'sqlite3'
require 'pp'

#DROP
begin
  db = SQLite3::Database.new('test.db')
  db.execute('DROP TABLE customers')
  db.execute('DROP TABLE vendors')
  db.execute('DROP TABLE sale')
  db.execute('DROP TABLE incoming')
  db.execute('DROP TABLE products')
  db.execute('DROP TABLE prices')
  db.execute('DROP TABLE magazine_sales')
  db.execute('DROP TABLE magazine_incoming')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#CREATE TABLE
begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE customers(
              id_customer INTEGER PRIMARY KEY,
              name  varchar(50) NOT NULL,
              email varchar(50) NOT NULL
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE vendors(
              id_vendor INTEGER PRIMARY KEY,
              name    varchar(50)  NOT NULL,
              city    varchar(30)  NOT NULL,
              address varchar(100) NOT NULL
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE sale(
              id_sale INTEGER PRIMARY KEY,
              id_customer integer  NOT NULL,
              date_sale   date     NOT NULL,
              FOREIGN KEY(id_customer) REFERENCES customers(id_customer)
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE incoming(
              id_incoming INTEGER PRIMARY KEY,
              id_vendor     integer  NOT NULL,
              date_incoming date     NOT NULL,
              FOREIGN KEY(id_vendor) REFERENCES vendors(id_vendor)
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE products(
              id_product INTEGER PRIMARY KEY,
              name   varchar(100) NOT NULL,
              author varchar(50)  NOT NULL
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE prices(
              id_product INTEGER,
              date_price_changes date   NOT NULL,
              price              double NOT NULL,
              FOREIGN KEY(id_product) REFERENCES products(id_product),
              PRIMARY KEY(id_product, date_price_changes)
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE magazine_sales(
              id_sale INTEGER,
              id_product integer  NOT NULL,
              quantity   integer  NOT NULL,
              FOREIGN KEY(id_sale) REFERENCES sale(id_sale),
              FOREIGN KEY(id_product) REFERENCES products(id_product),
              PRIMARY KEY(id_sale, id_product)
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE magazine_incoming(
              id_incoming INTEGER,
              id_product integer  NOT NULL,
              quantity   integer  NOT NULL,
              FOREIGN KEY(id_incoming) REFERENCES incoming(id_incoming),
              FOREIGN KEY(id_product) REFERENCES products(id_product),
              PRIMARY KEY(id_incoming, id_product)
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#INSERT
begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO vendors(name, city, address)
              VALUES(?, ?, ?)', 'ZAO MYRUBY', 'Kazan', 'Mycity 10/15')
  db.execute('INSERT INTO vendors(name, city, address)
              VALUES(?, ?, ?)', 'OOO VEDRO', 'Astana', 'Hlebnaya 9/24')
  db.execute('INSERT INTO vendors(name, city, address)
              VALUES(?, ?, ?)', 'OOO PRO IT', 'Minsk', 'Melnikov 2/11')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO customers(name, email)
              VALUES(?, ?)', 'Den', 'den@gmail.com')
  db.execute('INSERT INTO customers(name, email)
              VALUES(?, ?)', 'Akbar', 'akbar322@yandex.com')
  db.execute('INSERT INTO customers(name, email)
              VALUES(?, ?)', 'Oleg', 'oleg1@gmail.com')
  db.execute('INSERT INTO customers(name, email)
              VALUES(?, ?)', 'Leo', 'leoleo@yandex.com')
  db.execute('INSERT INTO customers(name, email)
              VALUES(?, ?)', 'Adam', 'adams@gmail.com')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO products(name, author)
              VALUES(?, ?)', 'Akhada', 'Saurabh Duggal')
  db.execute('INSERT INTO products(name, author)
              VALUES(?, ?)', 'Born to Fly', 'Nitin Sathe')
  db.execute('INSERT INTO products(name, author)
              VALUES(?, ?)', 'Private Delhi', 'Ashwin Sanghi')
  db.execute('INSERT INTO products(name, author)
              VALUES(?, ?)', 'Think with Me', 'Saharasri Subrata Roy Sahara')
  db.execute('INSERT INTO products(name, author)
              VALUES(?, ?)', 'Standing on an Apple Box', 'Aishwaryaa Rajinikanth Dhanush')
  db.execute('INSERT INTO products(name, author)
              VALUES(?, ?)', 'Sherlock Holmes', 'Arthur Conan Doyle')
  db.execute('INSERT INTO products(name, author)
              VALUES(?, ?)', 'Fantastic Beasts and Where to Find Them', 'J.K. Rowling')
  db.execute('INSERT INTO products(name, author)
              VALUES(?, ?)', 'The Wolf of the North', 'Duncan M. Hamilton')
  db.execute('INSERT INTO products(name, author)
              VALUES(?, ?)', 'A Torch Against the Night', 'Sabaa Tahir')
  db.execute('INSERT INTO products(name, author)
              VALUES(?, ?)', 'Endless Flight', 'AC Cobble')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO incoming(id_vendor, date_incoming)
              VALUES(?, ?)', 1, '2016-12-21')
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO incoming(id_vendor, date_incoming)
              VALUES(?, ?)', 2, '2016-11-09')
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO incoming(id_vendor, date_incoming)
              VALUES(?, ?)', 3, '2016-12-01')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO magazine_incoming(id_incoming, id_product, quantity)
              VALUES(?, ?, ?)', 1, 1, 10)
  db.execute('INSERT INTO magazine_incoming(id_incoming, id_product, quantity)
              VALUES(?, ?, ?)', 2, 2, 5)
  db.execute('INSERT INTO magazine_incoming(id_incoming, id_product, quantity)
              VALUES(?, ?, ?)', 3, 3, 2)
  db.execute('INSERT INTO magazine_incoming(id_incoming, id_product, quantity)
              VALUES(?, ?, ?)', 1, 4, 3)
  db.execute('INSERT INTO magazine_incoming(id_incoming, id_product, quantity)
              VALUES(?, ?, ?)', 2, 5, 9)
  db.execute('INSERT INTO magazine_incoming(id_incoming, id_product, quantity)
              VALUES(?, ?, ?)', 3, 6, 15)
  db.execute('INSERT INTO magazine_incoming(id_incoming, id_product, quantity)
              VALUES(?, ?, ?)', 1, 7, 7)
  db.execute('INSERT INTO magazine_incoming(id_incoming, id_product, quantity)
              VALUES(?, ?, ?)', 2, 8, 3)
  db.execute('INSERT INTO magazine_incoming(id_incoming, id_product, quantity)
              VALUES(?, ?, ?)', 3, 9, 4)
  db.execute('INSERT INTO magazine_incoming(id_incoming, id_product, quantity)
              VALUES(?, ?, ?)', 1, 10, 20)


  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO prices(id_product, date_price_changes, price)
              VALUES(?, ?, ?)', 1, '2017-01-08', 12)
  db.execute('INSERT INTO prices(id_product, date_price_changes, price)
              VALUES(?, ?, ?)', 2, '2017-02-11', 8)
  db.execute('INSERT INTO prices(id_product, date_price_changes, price)
              VALUES(?, ?, ?)', 3, '2017-01-12', 25)
  db.execute('INSERT INTO prices(id_product, date_price_changes, price)
              VALUES(?, ?, ?)', 4, '2017-01-09', 24)
  db.execute('INSERT INTO prices(id_product, date_price_changes, price)
              VALUES(?, ?, ?)', 5, '2017-01-21', 30)
  db.execute('INSERT INTO prices(id_product, date_price_changes, price)
              VALUES(?, ?, ?)', 6, '2017-01-30', 27)
  db.execute('INSERT INTO prices(id_product, date_price_changes, price)
              VALUES(?, ?, ?)', 7, '2017-01-03', 18)
  db.execute('INSERT INTO prices(id_product, date_price_changes, price)
              VALUES(?, ?, ?)', 8, '2017-01-04', 26)
  db.execute('INSERT INTO prices(id_product, date_price_changes, price)
              VALUES(?, ?, ?)', 9, '2017-01-25', 34)
  db.execute('INSERT INTO prices(id_product, date_price_changes, price)
              VALUES(?, ?, ?)', 10, '2017-01-18', 28)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO sale(id_customer, date_sale)
              VALUES(?, ?)', 1, '2017-02-10')
  db.execute('INSERT INTO sale(id_customer, date_sale)
              VALUES(?, ?)', 2, '2017-02-15')
  db.execute('INSERT INTO sale(id_customer, date_sale)
              VALUES(?, ?)', 3, '2017-02-20')
  db.execute('INSERT INTO sale(id_customer, date_sale)
              VALUES(?, ?)', 4, '2017-02-25')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO magazine_sales(id_sale, id_product, quantity)
              VALUES(?, ?, ?)', 1, 1, 1)
  db.execute('INSERT INTO magazine_sales(id_sale, id_product, quantity)
              VALUES(?, ?, ?)', 1, 2, 1)
  db.execute('INSERT INTO magazine_sales(id_sale, id_product, quantity)
              VALUES(?, ?, ?)', 1, 3, 1)
  db.execute('INSERT INTO magazine_sales(id_sale, id_product, quantity)
              VALUES(?, ?, ?)', 2, 4, 1)
  db.execute('INSERT INTO magazine_sales(id_sale, id_product, quantity)
              VALUES(?, ?, ?)', 3, 5, 1)

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end
