require 'sqlite3'
require 'pp'

#SELECT
begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT MIN(price), MAX(price), AVG(price) FROM prices')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT id_incoming FROM incoming
                      WHERE id_vendor = ?', 2)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT id_product, quantity FROM magazine_incoming
                      WHERE id_incoming = (SELECT id_incoming FROM incoming WHERE id_vendor = ?)', 2)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT magazine_incoming.id_product, magazine_incoming.quantity, prices.price
                      FROM magazine_incoming, prices
                      WHERE magazine_incoming.id_product = prices.id_product
                      AND id_incoming = (SELECT id_incoming FROM incoming WHERE id_vendor = ?)', 2)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT magazine_incoming.id_product, magazine_incoming.quantity, prices.price,
                      magazine_incoming.quantity * prices.price AS summa
                      FROM magazine_incoming, prices
                      WHERE magazine_incoming.id_product = prices.id_product
                      AND id_incoming = (SELECT id_incoming FROM incoming WHERE id_vendor = ?)', 2)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT city || address FROM vendors')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end
