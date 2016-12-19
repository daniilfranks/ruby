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
              id_product INTEGER PRIMARY KEY,
              date_price_changes date   NOT NULL,
              price              double NOT NULL,
              FOREIGN KEY(id_product) REFERENCES products(id_product)
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE magazine_sales(
              id_sale INTEGER PRIMARY KEY,
              id_product integer  NOT NULL,
              quantity   integer  NOT NULL,
              FOREIGN KEY(id_sale) REFERENCES sale(id_sale),
              FOREIGN KEY(id_product) REFERENCES products(id_product)
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE magazine_incoming(
              id_incoming INTEGER PRIMARY KEY,
              id_product integer  NOT NULL,
              quantity   integer  NOT NULL,
              FOREIGN KEY(id_incoming) REFERENCES incoming(id_incoming),
              FOREIGN KEY(id_product) REFERENCES products(id_product)
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

