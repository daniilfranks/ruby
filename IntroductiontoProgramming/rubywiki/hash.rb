p Hash["a", 100, "b", 200]
p Hash["a" => 100, "b" => 200]
p Hash[a: 100, b: 200]
p Hash[["a", 100],["b", 200]]
p Hash[[["a", 100],["b", 200]]]

h = Hash.new("Go fish")
h["a"] = 100
p h["c"]
p h

h = Hash.new { |hash, key| hash[key] = "Go Fish: #{key}" }
p h["c"]
p h["c"].upcase!
p h["d"]
p h

h1 = {:a => 1, :b => 2}
h2 = {:c => 3, :d => 4}
p h1 == h2
p h1 > h2
p h1 < h2

p h1[:a]
p h1[1]
p h1[:e] = 10
p h1
p h1.clear

h = { color:   ["red", "blue" "green"],
	  letters: ["a", "b", "c"]
}

p h.assoc(:letters)
p h.assoc(:car)


h = Hash.new
p h.default
p h.default(2)

h = Hash.new("default")
p h.default
p h.default(2)


h = {:a => 1, :b => 2}
h.default = "default"
p h[:a]
p h[:z]


hash = {:a => 1, :b => 2, :c => 3}
p hash.delete(:c)
p hash.delete(:z)
p hash.delete(:z) { |i| "#{i} not found" }

hash = {:a => 1, :b => 2, :c => 3}
p hash.delete_if { |k,v| k >= :b }


hash = {:a => 1, :b => 2, :c => 3}
hash.each { |k,v| puts "#{k}, #{v}"}
hash.each_key { |k| puts k}
hash.each_value { |v| puts v}

p hash.empty?

p hash.fetch(:a)
p hash.fetch(:d, "not found")

p hash.fetch_values(:b, :c)


hash = {:a => 1, :b => 2, :c => 3}
p hash.has_key?(:a)
p hash.has_key?(:z)

p hash.has_value?(1)
p hash.has_value?(100)

hash = {:a => 1, :b => 2, :c => 3}
p hash.invert


hash = {:a => 1, :b => 2, :c => 3}
p hash.key(2)

p hash.keys

p hash.length



h1 = {:a => 1, :b => 2, :c => 3}
h2 = {:a => 1, :b => 2, :c => 30}

p h1.merge(h2)


hash = {:a => 1, :b => 2, :c => 3}
p hash.rassoc(2)

hash = {:a => 1, :b => 2, :c => 3}
p hash.reject { |k,v| k < :b }
p hash.reject { |k,v| v > 2 }


h = { "a" => 100, "b" => 200 }
p h.replace({ "c" => 300, "d" => 400 })

hash = {:a => 1, :b => 2, :c => 3}
p hash.select { |k,v| k < :b }
p hash.select { |k,v| v > 2 }


hash = {:a => 1, :b => 2, :c => 3}
hash.shift
p hash

hash = {:a => 1, :b => 2, :c => 3}
hash.store(:a, 10)
p hash

p hash.sort
p hash.sort { |k,v| k[1] <=> v[1] }