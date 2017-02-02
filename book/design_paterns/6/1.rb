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
		1.0
	end
end

class MixTask < Task
	def initialize
		super('Mix!!!')
	end 

	def get_time
		2.0
	end
end

class MakeTask < Task
	def initialize
		super('Make Task!!!')
		@make_tasks = []
		add_make_task(DryTask.new)
		add_make_task(MixTask.new)
	end 

	def add_make_task(task)
		@make_tasks << task
	end

	def get_time
		time = 0.0
		@make_tasks.each { |task| time += task.get_time }
		time
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

task = Task.new('den')
p task.name
p task.get_time

dry_task = DryTask.new
p dry_task
p dry_task.name
p dry_task.get_time

make_task = MakeTask.new
p make_task
p make_task.get_time

p '*'*40

ct  = CompositeTask.new('zxc')
ct1 = CompositeTask.new('cvlq')
ct2 = CompositeTask.new('yuva')
ct3 = CompositeTask.new('opys')

ct.add_sub_task(ct1)
ct.add_sub_task(ct2)
ct.add_sub_task(ct3)
p ct

p ct.get_time
