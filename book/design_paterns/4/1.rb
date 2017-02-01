# http://docs.seattlerb.org/minitest/Minitest/Assertions.html#method-i-assert_output

class Report
	attr_reader   :title, :text 
	attr_accessor :formater 

	def initialize(formater)
		@title    = 'Report'
		@text     = ['ruby', 'php', 'c+', 'js']
		@formater = formater
	end

	def output_report
		@formater.output_report(@title, @text)
	end
end

class Formatter
	def output_report(title, text)
		raise 'Abstract method called'
	end
end

class HTMLFormater < Formatter
	def output_report(title, text)
		puts('<html>')

		puts('	<head>')
		puts("		<title>#{title}</title>")
		puts('	</head>')

		puts('<body>')

		text.each do |line|
			puts("	<p>#{line}<p>")
		end

		puts('</body>')
		puts('</html>')
	end
end

class PainTextFormater < Formatter
	def output_report(title, text)
		puts title

		text.each { |i| p i }
	end
end


html = Report.new(HTMLFormater.new)
html.output_report

text = Report.new(PainTextFormater.new)
text.output_report

csv = PainTextFormater.new
csv.output_report('hi', ['word'])
