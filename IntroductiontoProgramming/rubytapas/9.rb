p :foo

p "foo-bar (baz)".to_sym

p :"foo-bar (baz)"

post_id = 123

p :"post-#{post_id}"

p :'hello, "world"'

p %s{foo:bar}