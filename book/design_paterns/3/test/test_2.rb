require 'minitest/autorun'
require_relative '../2'

class TestHTMLReport < Minitest::Test
	def setup
		@html_report = HTMLReport.new
	end

	#Проверит регуляркой
	def test_output_start
		assert_output(/<html>/) { @html_report.output_start }
	end

	def test_output_body
		assert_output(/	<p>Ruby<p>/) { @html_report.output_body('Ruby') }
	end
end
