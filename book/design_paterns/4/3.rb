class Report
	attr_reader   :title, :text 
	attr_accessor :formater 

	def initialize(&formater)
		@title    = 'Report'
		@text     = ['ruby', 'php', 'c+', 'js']
		@formater = formater
	end

	def output_report
		@formater.call(self)
	end
end

HTMLFormater = lambda do |context|
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

PainTextFormater = lambda do |context|
	puts context.title

	context.text.each { |i| puts i }
end


html = Report.new(&HTMLFormater)
html.output_report

text = Report.new(&PainTextFormater)
text.output_report
