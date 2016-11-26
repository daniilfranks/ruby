require 'json'
require 'ostruct'

github = '{
  "login": "danilababanov",
  "id": 15922514,
  "avatar_url": "https://avatars.githubusercontent.com/u/15922514?v=3",
  "gravatar_id": "",
  "url": "https://api.github.com/users/danilababanov",
  "html_url": "https://github.com/danilababanov",
  "followers_url": "https://api.github.com/users/danilababanov/followers",
  "following_url": "https://api.github.com/users/danilababanov/following{/other_user}",
  "gists_url": "https://api.github.com/users/danilababanov/gists{/gist_id}",
  "starred_url": "https://api.github.com/users/danilababanov/starred{/owner}{/repo}",
  "subscriptions_url": "https://api.github.com/users/danilababanov/subscriptions",
  "organizations_url": "https://api.github.com/users/danilababanov/orgs",
  "repos_url": "https://api.github.com/users/danilababanov/repos",
  "events_url": "https://api.github.com/users/danilababanov/events{/privacy}",
  "received_events_url": "https://api.github.com/users/danilababanov/received_events",
  "type": "User",
  "site_admin": false,
  "name": "Den",
  "company": null,
  "blog": "danilababanov.me",
  "location": "Russia, Tatarstan, Kazan",
  "email": "danila_babanov@yahoo.com",
  "hireable": null,
  "bio": null,
  "public_repos": 77,
  "public_gists": 0,
  "followers": 2,
  "following": 68,
  "created_at": "2015-11-19T08:58:01Z",
  "updated_at": "2016-11-16T12:02:48Z"
}'

hash = JSON.parse(github)
p hash['login']
p hash.class

hash2 = OpenStruct.new(JSON.parse(github))
p hash2.login
p hash2.class


user = { name: 'Den', age: 25, city: 'Kazan' }
p user = JSON.generate(user)
File.open('user.json', 'w') do |w|
  w << user
end

file = File.read('user.json')
hash = JSON.parse(file)
p hash['name']