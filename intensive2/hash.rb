hash = {}

hash[:key1] = { number: 1, file: '' }
hash[:key2] = { number: '', file: 'json.rb' }
hash[:key3] = { number: 3, file: 'hash.rb' }

hash.each do |k, v|
	v.each do |k, v|
		#p k, v
	end
end

def hash_nil(val, k,v)
	if v.is_a?(String)
		if v.strip.empty?
			val[k] = nil
		end
	end
end

foo = hash.each do |k, val|
	#p val
	val.each do |k, v|
		#p k, v
		hash_nil(val, k, v)
	end
end

delete = foo.each do |k, v| v.delete_if do |k, v| v.nil? end end
p delete

