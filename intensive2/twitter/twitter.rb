# gem install twitter

require 'twitter'
require 'awesome_print'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

#tweet
#ap client.update("Gem tweet!")

#follow
#ap client.follow('w33haa')
#ap client.follow(2191044079)

#followers
#ap client.followers('danila_babanov')

#friends
#ap client.friends
#ap client.friends('danila_babanov')

#timeline
#ap client.user_timeline('danila_babanov')
