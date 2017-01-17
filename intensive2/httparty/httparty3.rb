require 'base64'
require 'httparty'
require 'json'
require 'awesome_print'

consumer_key = "2qEmFIbFXinof6OYRjcckd12h"
consumer_secret = "hrOgYbZH3bXlFrMGsrpaVX5kP9OgmOxEodCqH1MO7ATWA2aQwk"

credentials = Base64.encode64("#{consumer_key}:#{consumer_secret}").gsub("\n", '')
url = "https://api.twitter.com/oauth2/token"
body = "grant_type=client_credentials"
headers = {
  "Authorization" => "Basic #{credentials}",
  "Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8"
}

r = HTTParty.post(url, body: body, headers: headers)
bearer_token = JSON.parse(r.body)['access_token']
#ap "Twitter bearer token is: #{bearer_token}"

api_auth_header = {"Authorization" => "Bearer #{bearer_token}"}
#url = "https://api.twitter.com/1.1/search/tweets.json?q=nba"
#ap HTTParty.get(url, headers: api_auth_header).body

#url2 = 'https://api.twitter.com/1.1/users/show.json?screen_name=danila_babanov'
#ap HTTParty.get(url2, headers: api_auth_header)

#url3 = 'https://api.twitter.com/1.1/friends/ids.json?cursor=-1&screen_name=twitterapi&count=5000'
#ap HTTParty.get(url3, headers: api_auth_header)

#url4 = 'https://api.twitter.com/1.1/account/settings.json?lang=en'
#ap HTTParty.post(url4, headers: api_auth_header)
