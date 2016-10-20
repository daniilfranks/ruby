p %w[ant bear cat].all? { |word| word.length >= 3 }
p %w[ant bear cat].all? { |word| word.length >= 4 }

p %w[ant bear cat].any? { |word| word.length >= 3 }
p %w[ant bear cat].any? { |word| word.length >= 4 }

p (1..4).map { |i| i*i }
p (1..4).collect { |i| i*i }

arr = [1,2,3,4,5,6,2]
p arr.count
p arr.count(2)
p arr.count{ |i| i.odd? }
p arr.count{ |i| i.even? }

arr = [1,2,3,4,5]
p arr.drop(3)

arr = [1,2,3,4,5]
p arr.drop_while { |i| i < 3 }

p "="*20
(1..10).each_cons(3) { |i| p i}

p "="*20
(1..10).each_slice(3) { |i| p i }


arr = ["den", "jok", "glen", "leo"]
arr.each_with_index { |k,v| p "#{k} #{v}"}

hash = {}
arr.each_with_index { |k,v| hash[k] = v }
p hash

p (1..5).to_a

p "="*20
p (1..10).find_all { |i| i % 2 == 1 }
p (1..10).find_all { |i| i % 2 == 0 }
p (1..10).find_all { |i| i % 3 == 0 }

p (1..10).select { |i| i.odd? }
p (1..10).select { |i| i.even? }

arr = (1..10).to_a
p arr.first
p arr.first(5)
p arr[0..4]
p arr[0,5]

p arr.last
p arr.last(5)
p arr[-5..-1]
p arr[-5,5]

p (1..100).grep(50..55)
p (1..100).grep(20..30)


arr = ("a".."z").to_a
p arr.max
p arr.max(2)

arr = ["danila", "jok", "glen", "leo"]
p arr.max_by { |i| i.length }


arr = ("a".."z").to_a
p arr.min
p arr.min(2)

arr = ["danila", "jok", "glen", "leo"]
p arr.min_by { |i| i.length }


p (1..10).reject { |i|  i % 3 == 0 }
p [1, 2, 3, 4, 5].reject { |num| num.even? }

arr = [3,1,6,2,9,7]
p arr.sort
p arr.sort.reverse

p (1..10).sort { |a,b| b <=> a }

arr = ["danila", "jok", "glen", "leo"]
p arr.sort
p arr.sort_by { |i| i.length }

a = (1..10)
p a.take(3)
p a.take_while { |i| i < 3 }