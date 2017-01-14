# gem install activesupport

#require 'active_support'
#require 'active_support/core_ext'
require 'active_support/all'

array = []
array2 = []
hash = {}
str_true = true
str_false = false
str_nil = nil
string = ''
integer = 0

p array.blank?
p array.present?

p hash.blank?
p hash.present?

p '*'*45

p str_true.blank?
p str_true.present?

p str_false.blank?
p str_false.present?

p str_nil.blank?
p str_nil.present?

p '*'*45

p string.blank?
p string.present?

p integer.blank?
p integer.present?

p '*'*45

config = { host: nil }

host = config[:host].presence || 'localhost'
p host

p '*'*45

string = 'ruby'
p string.try!(:capitalize)

string = nil
p string.try!(:capitalize)

p 'ruby on rails'.to_param
p ['ruby on rails'].to_param
p ['ruby', 'on', 'rails'].to_param

class User
	attr_accessor :id, :name

	def initialize(id, name)
		@id = id
		@name = name
	end
end

den = User.new(1, 'Den')
p den.instance_values

p '*'*45

array = [1,2,3,4,5]
p array.include?(10)
p 10.in?(array)
p 5.in?(array)

p '*'*45

p '/hi/ /world/'.remove('/')

p " \n  foo\n\r \t bar \n".squish
p " \n  foo\n\r \t bar \n".split.join(' ')

p 'First title text text'.truncate(14)
p 'First title text text'.truncate(18, omission: ' [read]')
p 'First title text text'.truncate(12, separator: ' ')
p 'First title text text'.truncate(14, separator: /\s/)

p 'First title text text'.split[0..1].join(' ')

p '*'*45

p 'name'.inquiry.name?
p 'name '.inquiry.name?

p 'name'.pluralize
p 'ruby'.pluralize
p 'item'.pluralize
p 'cart'.pluralize
p 'blog'.pluralize
p 'post'.pluralize

p 'posts'.singularize
p 'rubies'.singularize

p '*'*45

p 'post'.camelize
p 'class_post'.camelize

p 'Post'.underscore
p 'ClassPost'.underscore

p 'ruby on rails'.titleize

p 'John Smith'.parameterize
p "John Smith".parameterize(preserve_case: true)

p 'User'.foreign_key
p 'Post'.foreign_key

p '*'*45

p '2017-01-14'.to_date

p 5551234.to_s(:phone)

p 1234567890.50.to_s(:currency)
p 1234.to_s(:currency)

p 1.ordinalize
p 2.ordinalize
p 3.ordinalize

p [1,2,3].sum
p (1..10).sum

p '*'*45
