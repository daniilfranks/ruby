=begin 
порождающий шаблон проектирования, предоставляющий подклассам интерфейс 
для создания экземпляров некоторого класса. В момент создания наследники 
могут определить, какой класс создавать. [...] Это позволяет использовать 
в коде программы не специфические классы, а манипулировать абстрактными 
объектами на более высоком уровне.
=end

class CsvFormatter
  def format(data)
    return '' if data.empty?

    result = data.keys.join(',') + "\n"
    result += data.values.join(',') + "\n"
  end
end

class JsonFormater
  require 'json'

  def format(data)
    return '' if data.empty?

    data.to_json
  end
end

class TsvFormatter
  def format(data)
    return '' if data.empty?

    result = data.keys.join("\t") + "\n"
    result += data.values.join("\t") + "\n"
  end
end

class Formatter
  def self.for(type)
    case type
    when 'csv'
      CsvFormatter.new
    when 'json'
      JsonFormater.new
    when 'tsv'
      TsvFormatter.new
    else
      raise 'Unsupported tupe of report'
    end
  end
end

class ReportGenerator
  def self.generate(data, type)
    Formatter.for(type).format(data)
  end
end

report_data = { foo_key: 'foo', bar_key: 'bar', baz_key: 'baz' }
puts ReportGenerator.generate(report_data, 'json')
puts ReportGenerator.generate(report_data, 'csv')
puts ReportGenerator.generate(report_data, 'tsv')