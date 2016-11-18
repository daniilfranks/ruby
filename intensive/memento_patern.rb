=begin
Поведенческий шаблон проектирования Хранитель используется, 
когда нам необходимо отслеживать состояние объекта. 
Это позволит нам вернуть объект в одно из предыдущих состояний 
в любой момент, когда это потребуется.
=end

class Memento

  attr_reader :state

  def initialize(state)
    @state = state
  end
end

class Originator

  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def get_state
    Memento.new(@color)
  end

  def restore_state(memento)
    @color = memento.state
  end
end

class Caretaker

  attr_reader :originator
  attr_reader :states

  def initialize(originator)
    @originator = originator
    @states     = []
    commit_state
  end

  def set_state(color)
    @originator.color = color
    commit_state
  end

  def get_sate
    @originator.get_state
  end

  def restore_state
    return if @states.size == 0
    @originator.color = @states.pop
  end

  private

  def commit_state
    @states << @originator.get_state
  end
end


caretaker = Caretaker.new(Originator.new('RED'))
p caretaker.get_sate
caretaker.set_state('GREEN')
p caretaker.get_sate
caretaker.set_state('BLUE')
p caretaker.get_sate 

caretaker.restore_state
p caretaker.get_sate 
caretaker.restore_state
p caretaker.get_sate
caretaker.restore_state
p caretaker.get_sate 