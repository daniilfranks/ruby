require 'moneta'

store = Moneta.new(:File, dir: "store")
store['question'] = "Life, the universe, and everything"
store["answer"] = 42