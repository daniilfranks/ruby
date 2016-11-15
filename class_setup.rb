class ApiConnector
	attr_accessor :title, :description, :url

	def initialize(title: title(), description: description(), url: url = "google.com")
		@title = title
		@description = description
		@url = url
	end

	def testing_initializers
		puts @title
		puts @description
		puts @url
	end

	def api_logger
		puts "Api connection starting"
	end
end

class SmsConnector < ApiConnector
	def send_sms
		puts "Sending sms..."
	end
end

class PhoneConnector < ApiConnector
	def api_logger
		puts "Phone call Api connection starting"
	end

	def send_phone_call
		puts "Sending phone call..."
	end
end

class MailConnector < ApiConnector
	def send_email
		puts "Sending email..."
	end
end

api = ApiConnector.new(title: "My title",description: "My description", url: "yahoo.com")
sms = SmsConnector.new(title: "My title",description: "My description", url: "yahoo.com")
phone = PhoneConnector.new(title: "My title",description: "My description", url: "yahoo.com")
email = MailConnector.new(title: "My title",description: "My description", url: "yahoo.com")

sms.send_sms
phone.send_phone_call
email.send_email
api.api_logger
phone.api_logger