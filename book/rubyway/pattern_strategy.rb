def country_taxes(amount, country)
	taxes = 
		case country
		when 'Russia' then (amount * 0.05) + 313
		when 'USA' then (amount * 0.2) + 100
		when 'Denmark' then amount * 0.4
		else 0
	end
	amount - taxes
end

p country_taxes(7000, 'USA')
p country_taxes(7000, 'Russia')
p country_taxes(7000, 'Denmark')
p country_taxes(7000, 'Belarus')

p '*' * 40

class RusTaxes
	def self.taxes(amount)
		(amount * 0.05) + 313
	end
end

class USATaxes
	def self.taxes(amount)
		(amount * 0.2) + 100
	end
end

class DenTaxes
	def self.taxes(amount)
		amount * 0.4
	end
end

class Taxes
	def initialize
		@options            = {}
		@options['Russia']  = RusTaxes
		@options['USA']     = USATaxes
		@options['Denmark'] = DenTaxes
	end

	def country_taxes(amount, country)
		strategy = @options[country]
		strategy ? amount - strategy.taxes(amount) : amount
	end
end

p Taxes.new
p Taxes.new.country_taxes(7000, 'USA')

p RusTaxes.taxes(7000)
p USATaxes.taxes(7000)
p DenTaxes.taxes(7000)

p '*' * 40

class SalaruTaxes
	attr_reader :amount

	def initialize(amount)
		@amount             = amount
		@options            = {}
		@options['Russia']  = -> { (amount * 0.05) + 313 }
		@options['USA']     = -> { (amount * 0.2) + 100 }
		@options['Denmark'] = -> { amount * 0.4 }
	end

	def country_taxes(country)
		strategy = @options[country]
		strategy ? amount - strategy.call : amount
	end
end

p SalaruTaxes.new(7000)
p SalaruTaxes.new(7000).country_taxes('USA')
p SalaruTaxes.new(7000).country_taxes('Russia')
p SalaruTaxes.new(7000).country_taxes('Denmark')
p SalaruTaxes.new(7000).country_taxes('Belarus')


require 'ostruct'

def show(hash)
	response = OpenStruct.new(hash)

	return handle_error if response.status == 'error'
	return handle_fail if response.status == 'fail'

	if response.status == 'success'
		puts "Successful response: #{response.data}"
	end
end

def handle_error
	puts "Error message: #{response.error_message}"
end

def handle_fail
	puts "Request Faild"
end

hash_error = { status: 'error', error_message: 'fatal error', data: 'Hello method' }
hash_fail = { status: 'fail', error_message: 'fail', data: 'Hello method' }
hash_success = { status: 'success', error_message: 'fatal error', data: 'Hello method' }

show(hash_success)
# show(hash_error)
show(hash_fail)
