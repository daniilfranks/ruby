class Task
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def get_time
		0.0
	end
end

class DryTask < Task
	def initialize
		super('Dry!!!')
	end 

	def get_time
		10.0
	end
end

class MixTask < Task
	def initialize
		super('Mix!!!')
	end 

	def get_time
		20.0
	end
end

class CompositeTask < Task
	def initialize(name)
		super(name)
		@sub_task = []
	end

	def add_sub_task(task)
		@sub_task << task 
	end

	def remove_sub_task(task)
		@sub_task.delete(task)
	end

	def get_time
		time = 1.0
		@sub_task.each { |task| time += task.get_time }
		time
	end
end

class MakeCakeTask < CompositeTask
	def initialize
		super('Make cake')
		add_sub_task(MixTask.new)
		add_sub_task(DryTask.new)
	end
end

mct = MakeCakeTask.new
p mct
p mct.get_time
