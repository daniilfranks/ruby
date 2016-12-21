require 'sqlite3'
require 'pp'

#DROP
begin
  db = SQLite3::Database.new('test.db')
  db.execute('DROP TABLE employees')

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#CREATE TABLE
begin
  db = SQLite3::Database.new('test.db')
  db.execute('CREATE TABLE employees(
              Id INTEGER PRIMARY KEY NOT NULL,
              employee_id    integer NOT NULL,
              first_name     text    NOT NULL,
              last_name      text    NOT NULL,
              email          text    NOT NULL,
              phone_number   integer NOT NULL,
              hire_date      date    NOT NULL,
              job_id         text    NOT NULL,
              salary         integer NOT NULL,
              commission_pct text    NOT NULL,
              manager_id     integer NOT NULL,
              departament_id integer NOT NULL
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
  db.execute('INSERT INTO employees(employee_id, first_name, last_name, email, phone_number,
              hire_date, job_id, salary, commission_pct, manager_id, departament_id) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              200, 'Steven', 'King', 'stev12345@gmail.com', 51516345978, 
              '23-11-1989', 'AD_VP', 4900, '', 2, 80)
  db.execute('INSERT INTO employees(employee_id, first_name, last_name, email, phone_number,
              hire_date, job_id, salary, commission_pct, manager_id, departament_id) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              300, 'Chen', 'Jchen', 'chen@yahoo.com', 65920438238, 
              '11-05-1993', 'AD_PRES', 5800, '', 2, 90)
  db.execute('INSERT INTO employees(employee_id, first_name, last_name, email, phone_number,
              hire_date, job_id, salary, commission_pct, manager_id, departament_id) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              400, 'Urman', 'Jmurman', '00urman@gamil.com', 74634588349, 
              '04-08-1991', 'FI_PROG', 9300, '', 1, 90)
  db.execute('INSERT INTO employees(employee_id, first_name, last_name, email, phone_number,
              hire_date, job_id, salary, commission_pct, manager_id, departament_id) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              500, 'Olson', 'TJ', 'tj1234@mydomain.org', 87459201438, 
              '30-05-1992', 'FI_PROG', 8000, '', 3, 70)
  db.execute('INSERT INTO employees(employee_id, first_name, last_name, email, phone_number,
              hire_date, job_id, salary, commission_pct, manager_id, departament_id) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              600, 'Gee', 'Kgee', 'gee_kgee@yahoo.com', 95547728582, 
              '22-11-1997', 'IT_PROG', 4500, '', 5, 90)
  db.execute('INSERT INTO employees(employee_id, first_name, last_name, email, phone_number,
              hire_date, job_id, salary, commission_pct, manager_id, departament_id) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              700, 'Seo', 'Jseo', 'jseo@gmail.com', 10991354765, 
              '01-09-1992', 'AD_VP', 7000, '', 4, 70)
  db.execute('INSERT INTO employees(employee_id, first_name, last_name, email, phone_number,
              hire_date, job_id, salary, commission_pct, manager_id, departament_id) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              800, 'Marlow', 'Jamrlon', 'marlon88@yahoo.com', 34997189495, 
              '07-01-1993', 'IT_PROG', 1800, '', 3, 90)
  db.execute('INSERT INTO employees(employee_id, first_name, last_name, email, phone_number,
              hire_date, job_id, salary, commission_pct, manager_id, departament_id) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              900, 'Stiles', 'SStiles', 'sstiles@yahoo.com', 12345678944, 
              '19-10-1989', 'IT_PROG', 2800, '', 3, 60)
  db.execute('INSERT INTO employees(employee_id, first_name, last_name, email, phone_number,
              hire_date, job_id, salary, commission_pct, manager_id, departament_id) 
              VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
              101, 'Hall', 'Phall', 'phall322@phol.net', 79587654212, 
              '27-04-1995', 'AD_PRES', 3500, '', 1, 80)


  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

#SELECT
begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT * FROM employees')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT employee_id, first_name, email, phone_number, departament_id, manager_id
                      FROM employees
                      WHERE departament_id = ?', 90)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT employee_id, first_name, email, phone_number, departament_id, manager_id
                      FROM employees
                      WHERE departament_id = ? AND manager_id = ?', 90, 1)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT employee_id, first_name, email, departament_id, manager_id
                      FROM employees
                      WHERE job_id = ?
                      OR (departament_id = ? AND manager_id = ?)', 
                      'IT_PROG', 90, 1)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT departament_id, manager_id FROM employees')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT departament_id, manager_id, job_id FROM employees')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT employee_id, first_name, job_id, salary, departament_id
                      FROM employees
                      WHERE departament_id < ?
                      ORDER BY salary', 90)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT employee_id, first_name, job_id, salary, departament_id
                      FROM employees
                      WHERE departament_id < ?
                      ORDER BY salary DESC', 90)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT employee_id, first_name, job_id, salary, departament_id
                      FROM employees
                      WHERE departament_id < ?
                      ORDER BY departament_id, salary DESC', 90)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute('SELECT departament_id, manager_id, job_id 
                      FROM employees ORDER BY departament_id')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute("SELECT job_id, SUM(salary)
                      FROM employees 
                      GROUP BY job_id")
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute("SELECT job_id, COUNT(*)
                      FROM employees 
                      GROUP BY job_id")
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute("SELECT job_id, SUM(salary)
                      FROM employees
                      WHERE departament_id < ? 
                      GROUP BY job_id", 80)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute("SELECT job_id, COUNT(*)
                      FROM employees
                      GROUP BY job_id
                      ORDER BY COUNT(*) DESC",)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute("SELECT job_id, COUNT(*)
                      FROM employees
                      GROUP BY job_id
                      HAVING COUNT(*) <= ?", 2)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute("SELECT job_id, COUNT(*)
                      FROM employees
                      GROUP BY job_id
                      HAVING COUNT(*) <= ?
                      ORDER BY COUNT(*) DESC", 2)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute("SELECT job_id, SUM(salary)
                      FROM employees
                      WHERE departament_id < ?
                      GROUP BY job_id
                      HAVING SUM(salary) >= ?
                      ORDER BY SUM(salary)", 80, 2000)
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute("SELECT first_name, hire_date, salary
                      FROM employees
                      WHERE hire_date BETWEEN ? AND ?", '01-01-1990', '12-12-1995')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end

pp '*'*45

begin
  db = SQLite3::Database.new('test.db')
  array = db.execute("SELECT first_name, hire_date, salary
                      FROM employees
                      WHERE hire_date NOT BETWEEN ? AND ?", '01-01-1990', '12-12-1995')
  pp array

  db.close
rescue SQLite3::Exception => e
  puts 'Exception occurred'
  puts e
end
