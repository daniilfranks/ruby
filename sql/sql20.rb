require 'sqlite3'
require 'pp'

#DROP
begin
  db = SQLite3::Database.new('test.db')
  db.execute('DROP TABLE doctors')
  db.execute('DROP TABLE visits')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#CREATE TABLE
begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE doctors(
              id INTEGER PRIMARY KEY NOT NULL,
              doctor_name    text    NOT NULL,
              degree         text    NOT NULL   
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE visits(
              id INTEGER PRIMARY KEY NOT NULL,
              patient_name text      NOT NULL,
              vdate        text      NOT NULL,
              doctor_id     integer  NOT NULL
            )')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#INSERT
begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO doctors(doctor_name, degree) 
              VALUES(?, ?)', 'Dr. John Linga', 'MD')
  db.execute('INSERT INTO doctors(doctor_name, degree) 
              VALUES(?, ?)', 'Dr. Paul Henderson', 'MD')
  db.execute('INSERT INTO doctors(doctor_name, degree) 
              VALUES(?, ?)', 'Dr. Ke Gee', 'MBBS')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  db.execute('INSERT INTO visits(patient_name, vdate, doctor_id) 
              VALUES(?, ?, ?)', 'TJ Olson', '16-12-2016', 1)
  db.execute('INSERT INTO visits(patient_name, vdate, doctor_id) 
              VALUES(?, ?, ?)', 'John Seo', '17-12-2016', 1)
  db.execute('INSERT INTO visits(patient_name, vdate, doctor_id) 
              VALUES(?, ?, ?)', 'James Marlow', '18-12-2016', 3)
  db.execute('INSERT INTO visits(patient_name, vdate, doctor_id) 
              VALUES(?, ?, ?)', 'Jason Mallin', '20-12-2016', 2)
  db.execute('INSERT INTO visits(patient_name, vdate, doctor_id) 
              VALUES(?, ?, ?)', 'Julia Nayer', '16-12-2016', 2)


  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#SELECT
begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM doctors')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM visits')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

#SELECT
begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT doctors.id, doctors.doctor_name, visits.patient_name, doctors.degree
                      FROM doctors
                      INNER JOIN visits
                      ON doctors.id = visits.doctor_id
                      WHERE doctors.degree = ?', 'MD')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT doctors.id, doctors.doctor_name, visits.patient_name, doctors.degree
                      FROM doctors
                      INNER JOIN visits
                      ON doctors.id = visits.doctor_id
                      WHERE doctors.degree = ?', 'MBBS')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

