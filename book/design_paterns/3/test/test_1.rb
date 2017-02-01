require 'minitest/autorun'
require_relative '../2'

class TestReport < Minitest::Test
	def setup
		@report = Report.new
		@report.instance_variable_set(:@title, 'First title')
		@report.instance_variable_set(:@text, ['ruby', 'php', 'c+', 'js'])
	end

	def test_title
		assert_equal('First title', @report.instance_variable_get(:@title))
	end

	def test_text
		assert_equal(['ruby', 'php', 'c+', 'js'], @report.instance_variable_get(:@text))
	end

	def test_output_report
		assert_raises(RuntimeError){ @report.output_report }
	end

	def test_output_start
		assert_raises(RuntimeError){ @report.output_start }
	end
end
