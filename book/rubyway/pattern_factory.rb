class CsvFormater
	def format(data)
		"" if data.empty?

		result = data.keys.join(",") + "\n"
		result += data.values.join(",") + "\n"
	end
end

class TextFormater
	def format(data)
		"" if data.empty?

		result = data.keys.join(', ') + "\n"
		result += data.values.join(", ") + "\n"
	end
end

class Formater
	def self.for(type)
		case type
		when 'csv' then CsvFormater.new
		when 'text' then TextFormater.new
		else raise 'Unsupported format!'
		end
	end
end

class DocGenerator
	def self.generator(data, type)
		Formater.for(type).format(data)
	end
end

hash = { user: 'Adam Makmilan', age: 23 }

dg = DocGenerator.generator(hash ,'text')
puts dg
