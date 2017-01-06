require 'mysql2'
require 'pp'

begin
  client = Mysql2::Client.new(:host => "localhost", :username => "new_user", :password => "my_password", :database => "new_db")
  client.query("CREATE TABLE IF NOT EXISTS Writers(
  										Id INT PRIMARY KEY AUTO_INCREMENT, 
  										Name VARCHAR(25)
  										)")
  client.query("INSERT INTO Writers(Name) VALUES('Jack London')")
  client.query("INSERT INTO Writers(Name) VALUES('Honore de Balzac')")
  client.query("INSERT INTO Writers(Name) VALUES('Lion Feuchtwanger')")
  client.query("INSERT INTO Writers(Name) VALUES('Emile Zola')")
  client.query("INSERT INTO Writers(Name) VALUES('Truman Capote')")
rescue Mysql2::Error => e
  puts e
ensure
  client.close if client
end


begin
  client = Mysql2::Client.new(:host => "localhost", :username => "new_user", :password => "my_password", :database => "new_db")
  results = client.query("SELECT * FROM Writers LIMIT 5")
  results.each do |row|
    pp row
  end
rescue Mysql2::Error => e
  puts e
ensure
  client.close if client
end
