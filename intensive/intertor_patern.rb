=begin 
Еще один поведенческий шаблон проектирования — Итератор. 
Представляет собой объект, позволяющий получить последовательный доступ 
к элементам объекта-агрегата без использования описаний каждого из 
агрегированных объектов. Перебор элементов выполняется объектом итератора, 
а не самой коллекцией. Это упрощает интерфейс и реализацию коллекции, 
а также способствует более логичному разделению обязанностей. 
Рассмотрим этот шаблона на примере инвентаризации героя в игре.
=end

class Inventory

  include Enumerable
  attr_reader :items

  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end

  def each(&block)
    @items.each(&block)
  end
end

class Item

  attr_reader :title, :cost

  def initialize(title, cost = 0)
    @title = title
    @cost  = cost
  end

  def <=>(other)
    @cost <=> other.cost
  end
end

class InvertoryIterator

  def initialize(invertory)
    @items = invertory.items
    @index = 0
  end

  def has_next?
    @index < @item.size
  end

  def next
    value = @items[@index]
    @index += 1
    value
  end
end

item0 = Item.new('AK-47', 2700)
item1 = Item.new('Helmet', 650)
item2 = Item.new('Deagle', 800)

inventory = Inventory.new
inventory.add(item0)
inventory.add(item1)
inventory.add(item2)

iterator = InvertoryIterator.new(inventory)
p iterator.next.title
p iterator.next.title
p iterator.next.title

p inventory.max.title
p inventory.min.title