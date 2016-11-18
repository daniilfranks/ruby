=begin 
Рассмотрим еще один поведенческий шаблон проектирования, 
который назвается Стратегия. Суть паттерна заключается в делегировании 
какого-то поведения соответсвующему классу, реализующему определенный 
алгоритм. Например, у нас есть какой-то отчет, и в зависимости от запроса 
надо будет выводить информацию в HTML или XML, или как простой текст.
=end

class Report
  attr_reader   :title, :text
  attr_accessor :formatter

  def initialize(formatter)
    @title     = 'Monthly Report'
    @text      = ['Things are going', 'really, really well.']
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(self)
  end
end

class Formatter
  def output_report(title, text)
    raise 'Abstract method called'
  end
end

class HTMLFormater < Formatter
  def output_report(context)
    p('<html>')
    p('div')
    p("#{context.title}")
    context.text.each do |line|
      p("#{line}")
    end
    p('/div')
    p('</html>')
  end
end

class XmlFormater < Formatter
  def output_report(context)
    p('<xml>')
    p("#{context.title}")
    p("#{context.text.join(' ')}")
  end
end

class TextFormater < Formatter
  def output_report(context)

    p("**** #{context.title} ****")
    context.text.each do |line|
      p(line)
    end
  end
end

report = Report.new(HTMLFormater.new)
report.output_report

report.formatter = XmlFormater.new
report.output_report

report.formatter = TextFormater.new
report.output_report