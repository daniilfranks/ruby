require 'yaml'

p YAML.load('--- foo')

p YAML.dump('foo')

p [1,2,3,4,5].to_yaml
p hash = { name: 'Den', age: 25 }.to_yaml

