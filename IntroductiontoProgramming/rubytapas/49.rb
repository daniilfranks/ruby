module ROFLWeb
	module ModelUtils
		module_function
		def unique_id(object)
			if object.respond_to?(:to_unique_id)
				object.to_unique_id
			else
				"#{object.class.name}+#{object.hash.to_s(16)}"
			end
		end
	end

	module UrlHelpers
		include ModelUtils
		def url_for(object)
			"http://example.com/#{unique_id(object)}"
		end
	end

	class MemoryRepository
		include ModelUtils
		def initialize
			@repo = {}
		end

		def store(object)
			@repo[unique_id(object)] = object
		end

		def fetch(key, &block)
			@repo.fetch(key,&block)
		end
	end
end
				
class ClientCode
	def log_access(object)
		puts "#{ROFLWeb::ModelUtils.unique_id(object)} accessed at #{Time.now}"
	end
end