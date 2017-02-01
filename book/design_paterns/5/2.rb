class Payroll
	def update(changed_employee)
		puts "#{changed_employee.name}"
		puts "#{changed_employee.salary}"
	end
end

class Employee
	attr_accessor :name, :title, :salary

	def initialize(name, title, salary)
		@name      = name
		@title     = title
		@salary    = salary
		@observers = []
	end

	def salary=(new_salary)
		@salary = new_salary
		notify_observers
	end

	def notify_observers
		@observers.each do |observer|
			observer.update(self)
		end
	end

	def add_observer(observer)
		@observers << observer
	end

	def delete_observer(observer)
		@observer.delete(observer)
	end
end

payroll = Payroll.new
den = Employee.new('Den', 'Title', 50000)

den.add_observer(payroll)
den.salary = 70000

den.notify_observers
