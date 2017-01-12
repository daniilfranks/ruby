class State
  def initialize
    @data = [{}]
  end

  def [](key)
    @data.last[key]
  end

  def []=(key, value)
    @data.last[key] = value
  end
end

state = State.new

state['name'] = 'Den'
state['name2'] = 'Fedor'
p state


array = [{}]

key = 1
name = 'Leo'

key1 = 2
name1 = 'Jok'

array.last[key] = 'name'
array.last[key1] = 'name1'
p array
