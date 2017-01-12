class State

  def initialize
    @data = [{}]
  end

  def [](key)
    @data.last[key]
  end

  def []=(key,value)
    @data.last[key] = value
  end

  def checkpoint
    @data.push(Marshal.load(Marshal.dump(@data.last)))
  end

  def rollback
    @data.pop
  end

end


state = State.new

state['hej'] = 'hopp'

puts state['hej']

puts state
