class Payroll
	def update(changed_employee)
		puts "#{changed_employee.name}"
		puts "#{changed_employee.salary}"
	end
end

class Employee
	attr_reader :name
	attr_accessor :title, :salary

	def initialize(name, title, salary, payroll)
		@name    = name
		@title   = title
		@salary  = salary
		@payroll = payroll
	end

	def salary=(new_salary)
		@salary = new_salary
		@payroll.update(self)
	end
end

payroll = Payroll.new
den = Employee.new('Den', 'Title', 50000, payroll)

p den
den.salary = 70000
