class DummyObserver
	def update(*args)
		puts 'update called'
	end

	def update_salary(*args)
		puts 'update salary called'
		puts args
	end

	def update_title(*args)
		puts 'update title called'
		puts args
	end
end

old_salary = 50000
new_salary = 70000

observer = DummyObserver.new

old_title = 'Old title'
new_title = 'New title'

observer.update_salary(old_salary, new_salary)
observer.update_title(old_title, new_title)
