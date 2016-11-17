=begin
Представьте, что у вас есть некий код, который реализует определенный 
набор действий. Но есть различные сценарии, в которых определенные куски 
кода должны работать по-разному. Например, придумаем программу постройки 
здания. Процесс постройки для зданий одинаковый: заложить фундамент, 
построить стены, вставить окна, построить крышу, провести коммуникации 
и т. д. Но для разных зданий все эти действия будут существенно отличаться. 
В этом случае отлично подойдет Шаблонный метод.

Итак, суть паттерна Шаблонный метод в том, что есть класс определяющий 
основу алгоритма и позволяющий наследникам переопределять некоторые шаги 
алгоритма, не изменяя его структуру в целом.

В качеcтве примера будем «строить здания». Для начала определим базовый 
«абстрактный» класс BaseBuilding, который будет определять скелет алгоритма.
=end

class BaseBuilding
  def report_about_building
    make_preparations
    lay_foundation
    sum_up_communication
    build_walls
    create_windows
    make_roof
    take_out_trash
  end

  protected

  def make_preparations
    raise_error
  end

  def lay_foundation
    p 'Dig a pit and pour the foundation'
  end

  def sum_up_communication
    p 'Bring water pipes, electricity, gas'
  end

  def build_walls
    raise_error
  end

  def create_windows
    p 'put window'
  end

  def make_roof
    raise_error
  end

  def take_out_trash
    p 'Throw out the trash'
  end

  private

  def raise_error
    raise StandardError, 'The method must be defined in the successor'
  end
end

class Cottage < BaseBuilding
  protected

  def make_preparations
    p 'Buy wooden house'
  end

  def build_walls
    p 'Build a wooden frame'
  end

  def make_roof
    p 'Mac and Ruth sten sovered vith roofing material'
  end
end

class Skyscraper < BaseBuilding
  protected

  def make_preparations
    p 'Enter into a contract with a construction firm'
  end

  def build_walls
    p 'Masonry walls made of concrete and glass'
  end

  def make_roof
    p 'Build the roof, do heliport, antennas and etc'
  end
end

cottage = Cottage.new
cottage.report_about_building

puts''

skyscraper = Skyscraper.new
skyscraper.report_about_building