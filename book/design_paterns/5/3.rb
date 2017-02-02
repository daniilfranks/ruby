module Subject
	def initialize
		@observers = []
	end

	def notify_observers
		@observers.each do |observer|
			observer.call(self)
		end
	end

	def add_observer(&observer)
		@observers << observer
	end

	def delete_observer(&observer)
		@observer.delete(observer)
	end
end

class Employee
	include Subject
	attr_accessor :name, :title, :salary

	def initialize(name, title, salary)
		super()
		@name      = name
		@title     = title
		@salary    = salary
	end

	def salary=(new_salary)
		@salary = new_salary
		notify_observers
	end
end

den = Employee.new('Den', 'Title', 50000)

den.add_observer do |changed_employee|
	puts "#{changed_employee.name}"
	puts "#{changed_employee.salary}"
end

den.salary = 70000
