require 'httparty'
require 'awesome_print'

#response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')

#puts response
#puts response.body
#puts response.code
#puts response.message
#puts response.headers.inspect

class StackExchange
	include HTTParty

	base_uri 'api.stackexchange.com'

	def initialize(service, page, sort, order)
		@options = { query: { site: service, page: page, sort: sort, order: order } }
	end

	def questions
		self.class.get("/2.2/questions", @options)
	end

	def users
    self.class.get("/2.2/users", @options)
  end
end

stack_exchange = StackExchange.new('stackoverflow', 1, 'hot', 'asc')
ap stack_exchange.questions
#ap stack_exchange.users
