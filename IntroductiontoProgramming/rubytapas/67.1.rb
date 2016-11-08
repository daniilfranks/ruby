#gem install moneta
require 'moneta'

store = Moneta.new(:YAML, file: "store.yaml")
store['question'] = "Life, the universe, and everything"
store["answer"] = 42