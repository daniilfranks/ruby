require 'logger'
require 'optparse'
require 'ostruct'
require 'pp'
require 'stringio'

class User
	attr_accessor :name, :age

	def initialize(name, age)
		@name = name
		@age  = age
		@logger = Logger.new('logfile.log', 10, 1024000)
	end

	def method_missing(m, *args, &block)
		@logger.error("Undefined method: #{m}")
		#@logger.info("Undefined method: #{m}")
		#@logger.warn("Undefined method: #{m}")
		raise "Undefined method: #{m}"
	end
end

# user = User.new('Danila', 25)
# puts user.no_method

class Base
	def initialize(logger)
		@logger = logger
		@logger.debug("This  is #{self.class.name}")
	end

	def run
		@logger.fatal('Need to implement this function!')
		#raise 'ERROR! Need to implement this function!'
	end
end

class A < Base
	def initialize(logger)
		super(logger)
	end

	def run
		@logger.info("running #{self.class.name}")
	end
end

class B < Base
	def initialize(logger)
		super(logger)
	end

	def run
		@logger.info("running #{self.class.name}")
	end
end

logger = Logger.new('newlogger.log', 10, 1024000)

base = Base.new(logger)
base.run

a = A.new(logger)
a.run

b = B.new(logger)
b.run
