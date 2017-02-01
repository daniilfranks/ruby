class Report
	attr_reader   :title, :text 
	attr_accessor :formater 

	def initialize(formater)
		@title    = 'Report'
		@text     = ['ruby', 'php', 'c+', 'js']
		@formater = formater
	end

	def output_report
		@formater.output_report(self)
	end
end

class HTMLFormater
	def output_report(context)
		puts('<html>')

		puts('	<head>')
		puts("		<title>#{context.title}</title>")
		puts('	</head>')

		puts('<body>')

		context.text.each do |line|
			puts("	<p>#{line}<p>")
		end

		puts('</body>')
		puts('</html>')
	end
end

class PainTextFormater
	def output_report(context)
		puts context.title

		context.text.each { |i| puts i }
	end
end


html = Report.new(HTMLFormater.new)
html.output_report

text = Report.new(PainTextFormater.new)
text.output_report
