class Report
	def initialize
		@title = 'First title'
		@text  = ['ruby', 'php', 'c+', 'js']
	end

	def output_report(format = '')
		if format == 'html'
			puts('<!DOCTYPE html>')
			puts('<html>')

			puts('	<head>')
			puts("		<title>#{@title}</title>")
			puts('	</head>')

			puts('<body>')

			@text.each do |line|
				puts("	<p>#{line}<p>")
			end

			puts('</body>')
			puts('</html>')
		else
			puts "#{@title}"
			@text.each { |text| puts text }
		end
	end
end

report = Report.new
#report.output_report
report.output_report('html')
