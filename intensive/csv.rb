require 'csv'

# id, name, age, city
#generate file
CSV.open('users.csv', 'w') do |csv|
  csv << ['id', 'name', 'age', 'city']
  csv << [1, 'glen', 30, 'vladivastok']
  csv << [2, 'io', 1000, 'jasmin']
  csv << [3, 'den', 25, 'kazan']
end

# generate string
csv_string = CSV.generate do |csv|
  csv << ['id', 'name', 'age', 'city']
  csv << [1, 'glen', 30, 'vladivastok']
  csv << [2, 'io', 1000, 'jasmin']
  csv << [3, 'den', 25, 'kazan']
end

puts csv_string

p '='*30

CSV.foreach('users.csv') do |row|
  p row
end

p '='*30

users = CSV.read('users.csv')
p users

p '='*30


CSV.parse(csv_string) do |row|
  p row
end


#wcsv = File.open('users.csv', 'a')
#wcsv.write('4, writer, 50, writer')
#wcsv.close

print "Csv writer!\n"
print "Enter file name (filename.csv)\n"
filename = gets.strip

filename = 'default.csv' if filename == ''

loop do
  print "Enter name:\n"
  name = gets.strip
  break if name == ''

  print "Enter age:\n"
  age = gets.strip.to_i

  print "Enter city:\n"
  city = gets.strip

  array = []
  array << "#{name}, #{age}, #{city}"

  CSV.open(filename, 'a') do |write|
    write << array
  end
end