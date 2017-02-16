require 'singleton'

class SustemParams
	include Singleton

	def initialize
		@array ||= []
	end

	def add_param(hash)
		@array << hash
	end

	def show_param
		@array.each do |hash|
			hash.each {|key, value| puts "Key: #{key}, Value: #{value}" }
		end
	end
end

sustem_params = SustemParams.instance
sustem_params.add_param({name: 'First param', priority: 1, bool: true})
sustem_params.add_param({name: 'Two param', priority: 3, bool: false, color: '#aaa'})

sustem_params.show_param


class Logger
	include Singleton

	attr_reader :level

	ERROR_TYPE = { error: 1, warning: 2, info: 3 }.freeze

	def initialize
		@log   = File.open('log.txt', 'a+')
		@level = ERROR_TYPE[:warning]
	end

	def error(msg)
		@log.puts(msg)
		@log.flush
	end

	def warning(msg)
		@log.puts(msg) if @level >= ERROR_TYPE[:warning]
		@log.flush
	end

	def info(msg)
		@log.puts(msg) if @level >= ERROR_TYPE[:info]
		@log.flush
	end
end

logger = Logger.instance
p logger
logger.info('Info message')
logger.warning('Warning message')
logger.info('Info message')

#p logger = Logger.instance

# Error new method
#p logger = Logger.new
