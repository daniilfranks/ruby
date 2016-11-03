class Contest
	def initialize(options={})
		@notifire = options.fetch(:notifire) {
			method(:notify_user_by_email)
		}
	end

	def choose_winner
		#...
		@notifire.call(winning_user, "You're a lucky winner!")
	end

	def notify_user_by_email(user, message)
		#...
	end
end

class User
	def send_sms(message)
		puts "Sending SMS: #{message}"
		# ...
	end
end

class FacebookNotifier
	def initialize(auto_info)
		@auto_info = auto_info
	end

	def call(user, message)
		#...
	end
end

fb_notifier = FacebookNotifier.new(auto_info)
c = Contest.new(notifire: fb_notifier)