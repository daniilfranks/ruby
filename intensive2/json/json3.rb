require 'find'
require 'json'
require 'pathname'
require 'fileutils'
require 'ostruct'
require 'pp'

class JSONReader
	attr_accessor :filename, :hash_name

	def initialize(filename, hash_name)
		@filename  = filename
		@hash_name = hash_name
		@hash      = {}
		begin
			#raise "File #{@filename} already exists!" if File.exist?(@filename)
			#@file = File.new(@filename, 'w')
		rescue Exception => e
			puts e.message
		end
	end

	def write_hash(hash)
		begin
			file = File.new(@filename, 'a')
			file.write(JSON.generate(hash))
		rescue JSON::ParserError => e
			puts e.message.capitalize
		end
	end

	def write_one_object(hash)
		begin
			file = File.new(@filename, 'a')
			file.write(JSON.generate(hash))
		rescue JSON::ParserError => e
			puts e.message.capitalize
		end
	end

	def read
		begin
			file = File.read(@filename)
			JSON.parse(file, object_class: OpenStruct)
		rescue JSON::ParserError => e
			puts e.message.capitalize
		end
	end
end

hash = { 1 => { name: 'Danila', age: 25 }, 2 => { name: 'Leon', age: 30 },
				 3 => { name: 'Ash', age: 19 }
				}

hash2 = { 4 => { name: 'Jok', age: 27 }, 5 => { name: 'Gleb', age: 23 },
				  6 => { name: 'Karbon', age: 32 }
				}

hash3 = { name: 'Tiny', age: 35 }

#json = JSONReader.new('json3.json')

#json.write(hash)
#json.write(hash2)

#pp json.read
