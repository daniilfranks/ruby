# внедрение зависимости

class DataSource
  def data
    [
      { user: 'Adrian Lewis', email: 'adrian@lewis.com' },
      { user: 'Phil Taylor', email: 'phil@taylor.com' }
    ]
  end
end

class CsvDataFormatter
  def format(data)
    return '' if data.empty?

    csv = data.first.keys.join(', ') + "\n"
    data.each { |hsh| csv += hsh.values.join(', ') + "\n" }

    csv
  end
end

p ds = DataSource.new
p ds.data

csv = CsvDataFormatter.new
puts csv.format(ds.data)

require 'json'

class JsonDataFormater
  def format(data)
    data.to_json
  end
end


class ReportGenerator

  attr_reader :data_source, :formatter

  def initialize(formatter = CsvDataFormatter.new, data_source = DataSource.new)
    @formatter   = formatter
    @data_source = data_source
  end

  def generate
    formatter.format(data_source.data)
  end
end

report_generator = ReportGenerator.new
puts report_generator.generate

puts ReportGenerator.new(JsonDataFormater.new).generate