# gem install envyable
# .gitignore
# config/env.yml

require 'envyable'

Envyable.load('config/env.yml', environment='production')

puts ENV['TEST_KEY']

puts ENV['PRODUCTION_KEY']
