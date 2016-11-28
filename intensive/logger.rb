require 'logger'

logger = Logger.new('logfile.log', 10, 1024000)

begin
  3 / 0
rescue Exception => e
  logger.error "Error #{e}"
end

begin
  'first' * 'second'
rescue Exception => e
  logger.error "Error #{e}"
end


#logger.fatal { "Argument 'foo' not given." }
#logger.error "Argument #{ @foo } mismatch."
#logger.info('initialize') { "Initializing..." }
#logger.add(Logger::FATAL) { 'Fatal error!' }
logger.close