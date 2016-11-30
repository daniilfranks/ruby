class Lister
  List = Struct.new(:name, :tasks) do 
    def initialize(name)
      super(name, [])
    end

    def add_task(name)
      task = Task.new(name)
      yield task if block_given?
      tasks << task
      task
    end
  end

  Task = Struct.new(:name, :status) do
    def initialize(name)
      super(name, :todo)
    end
  end

  attr_reader :lists

  def initialize
    @lists = []
  end

  def add_list(name)
    list = List.new(name)
    yield list if block_given?
    lists << list
    list
  end
end

lister = Lister.new
lister.add_list('ship chores') do |list|
  list.add_task('Early rise (3:00PM)')
  list.add_task('Waffles vindaloo with Kryten')
  list.add_task('Call Rimmer a smeghead')
end

require 'yaml/store'

store = YAML::Store.new('todo.yaml')

store.transaction do |s|
  s['lister'] = lister
end

store.transaction do |s|
  s['lister'].lists.first.tasks
end