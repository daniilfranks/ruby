module RoflRest
	class Client
		def initialize(uri, logger=Logger.new($stderr))
			@uri = uri
			@logger = logger
		end

		def get(params={})
			response = do_request(:get, params)
			handle_error(response)
		end

		def put(params={})
			response = do_request(:put, params)
			handle_error(response)
		end

		def post(params={})
			response = do_request(:post. params)
			handle_error(response)
		end

		def raise_on_error(response)
			if response.code.to_i >= 500
				raise ServerError, response.code
			end
			response
		end

		def log_error(response)
			if response.code.to_i >= 500
				@logger.error "Reqest to #{@uri} failed: #{response.code}"
			end
			response
		end

		def do_request(method, params)
		end
	end
end

class MyClient < RoflRest::Client
	def get(params={})
		tries = 0
		begin
			response = do_request(:get, params)
			return response is response.code == '200'
			log_error(response)
			tries += 1
			sleep 1
		end while tries < 3
		raise_on_error(response)
	end
end