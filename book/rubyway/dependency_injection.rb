class DataSource
	# sql, array, hash, json
	def data
		[
			{ user: 'Adam Makmilan', age: 23 },
			{ user: 'Ashot Glihgfsd', age: 30 }
		]
	end
end


class CsvFormater
	def format(data)
		"" if data.empty?

		csv = data.first.keys.join(",") + "\n"
		data.each { |hsh| csv += hsh.values.join(",") + "\n" }

		csv
	end
end

class TextFormater
	def format(data)
		"" if data.empty?

		text = data[0].keys.join(', ') + "\n"
		data.each { |i| text += i.values.join(", ") + "\n" }

		text
	end
end

class DocGenerator
	attr_reader :data_source, :formatter

	def initialize(formatter = CsvFormater.new, data_source = DataSource.new)
		@formatter    = formatter
		@data_source  = data_source
	end

	def generator
		formatter.format(data_source.data)
	end
end

csv1 = CsvFormater.new.format(DataSource.new.data)
puts csv1

text1 = TextFormater.new.format(DataSource.new.data)
puts text1

dg = DocGenerator.new
puts dg.generator

dg2 = DocGenerator.new(TextFormater.new)
puts dg2.generator
