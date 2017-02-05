class Report
	def initialize
		@title = 'First title'
		@text  = ['ruby', 'php', 'c+', 'js']
	end

	def output_report
		output_start
		output_head
		output_body_start
		@text.each do |line|
			output_body(line)
		end
		output_body_end
		output_end
	end	

	def output_start
		raise 'Called abstract method: output_start'
	end

	 def output_head
    raise 'Called abstract method: output_head'
  end

  def output_body_start
    raise 'Called abstract method: output_body_start'
  end

  def output_body(line)
    raise 'Called abstract method: output_body'
  end

  def output_body_end
    raise 'Called abstract method: output_body_end'
  end

  def output_end
    raise 'Called abstract method: output_end'
  end
end

class HTMLReport < Report
	def output_start
		puts('<html>')
	end

	def output_head
		puts('	<head>')
		puts("		<title>#{@title}</title>")
		puts('	</head>')
	end

	def output_body_start
		puts('<body>')
	end

	def output_body(line)
			puts("	<p>#{line}<p>")
	end

	def output_body_end
		puts('</body>')
	end

	def output_end
		puts('</html>')
	end
end

class PlainTextReport < Report
	def output_start; end

	def output_head
		puts @title
	end

	def output_body_start; end

	def output_body(line)
		puts line
	end

	def output_body_end; end

	def output_end; end
end

html_report = HTMLReport.new
#p html_report.output_report
#html_report.output_start

plain_text_report = PlainTextReport.new
#p plain_text_report.output_report
