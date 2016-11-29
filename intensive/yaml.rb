require 'yaml'

p YAML.load('--- foo')

p YAML.dump('foo')

p [1,2,3,4,5].to_yaml
p hash = { name: 'Den', age: 25 }.to_yaml

data = { 'fruits': ['orange', 'apple', 'grape'] }
data = YAML.dump(data, File.open('sample.yml', 'w'))


data = open('sample2.yml', 'r') { |f| YAML.load(f) }
p data