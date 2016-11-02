module Logged
	def logged_send(name, *args, &block)
		original_send = Object.instance_method(:send)
		bound_send = original_send.bind(self)
		puts "Sending #{name}(#{args.map(&:inspect).join(', ')})"
		bound_send.call(name, *args, &block)
	end
end

module PigeonPost
	def send(*messages)
		puts "You message is winging its recipient!"
	end
end

class Greeter
	include PigeonPost
	include Logged

	def hello(subject)
		puts "Hello, #{subject}"
	end
end

Greeter.new.logged_send(:hello, "Major Tom")