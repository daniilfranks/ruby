module Key2id
	def key_2_idet(key)
		key.split(':').last
	end
end

class Testar
	include Key2id

	def initialize
		@key_2_id = -> key { key.split(':').last }
	end

	def convert
		puts @key_2_id.call('1:2:10001')
		puts key_2_idet('1:2:10001')
	end
end

class MeraTest
	def initialize
		@l = -> { puts @nisse }
	end

	def mera_av
		@nisse = 'hej hopp'
	end
end

test = Testar.new
p test.convert

mera = MeraTest.new
p mera.mera_av
