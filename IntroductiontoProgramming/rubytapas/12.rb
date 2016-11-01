auth = {
	'uid' => 12345,
	'info' => {
	}
}

email_address = auth['info'].fetch('email'){ 'abcd@example.com' }
p email_address


require 'logger'
class NullLogger
	def method_missing(*); end
end

options = {logger: false}
logger = options.fetch(:logger) {Logger.new($stdout)}
unless logger 
	logger = NullLogger.new
end

p logger

{}.fetch(:foo){:default}
{foo: nil}.fetch(:foo){:default}
{foo: false}.fetch(:foo){:default}