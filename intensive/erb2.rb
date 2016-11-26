require 'erb'
class MyClass
  extend ERB::DefMethod
  def_erb_method('render()', 'example.erb')
  def initialize(items)
    @items = items
  end
end

print MyClass.new([10,20,30]).render()