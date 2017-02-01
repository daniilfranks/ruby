class Subject
	def initialize
		@observers = []
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

class Employee < Subject
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

subject = Subject.new
den = Employee.new('Den', 'Title', 50000)

den.add_observer(subject)
den.salary = 70000