class Task
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def get_time
		0.0
	end
end

class CompositeTask < Task
	def initialize(name)
		super(name)
		@sub_tasks = []
	end

	def <<(task)
		@sub_tasks << task 
	end

	def [](index)
		@sub_tasks[index] 
	end

	def [](index, new_value)
		@sub_tasks[index] = new_value
	end

	def tasks_size
		@sub_tasks.size
	end

	def remove_sub_task(task)
		@sub_tasks.delete(task)
	end

	def get_time
		time = 1.0
		@sub_tasks.each { |task| time += task.get_time }
		time
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

class MakeBatterTask < CompositeTask
	def initialize
		super('Make batter')
		self << DryTask.new
		self << MixTask.new 
	end
end

mbt = MakeBatterTask.new
p mbt
p mbt.tasks_size
p mbt.get_time
