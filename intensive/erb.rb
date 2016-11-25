require 'erb'

template = "1 + 1 = <%= 1 + 1 %>"
puts ERB.new(template).result

title = 'First title'
puts ERB.new("<h1> <%= title %> </h1>").result

p '+'*30

class Post
  def initialize
    @template = File.read('index.erb')
  end

  def write(title, description)
    File.open('index.erb', 'w') do |write|
      write.write(title)
      write.write(description)
    end
  end

  def render
    ERB.new(@template).result
  end
end

first = Post.new
first.write("<h1>First post</h1>\n", "<p>text text text</p>\n")
p first.render

p '+'*30

class LayoutRenderer
end

layout_template = File.read('layout.html.erb')
inner_template = File.read('index.html.erb')

layout = ERB.new(layout_template)
inner = ERB.new(inner_template)

layout.def_method(LayoutRenderer, 'render')

result = LayoutRenderer.new.render do
  inner.result # call the regular erb #result method
end

puts result