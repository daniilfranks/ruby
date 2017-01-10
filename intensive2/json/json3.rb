require 'find'
require 'json'
require 'json/pure'
require 'pathname'
require 'fileutils'
require 'ostruct'

class JSONReader
	attr_accessor :filename, :events, :requirements

	def initialize(filename)
		@filename = filename
		begin
			# Проверка что бы файл был создан.
			raise "File #{@filename} already exists!" unless File.exist?(@filename)
			@file = File.new(@filename, 'w')
		rescue Exception => e
			puts e.message
		end
	end

	def write(hash)
		begin
			@file.write(JSON.generate(hash))
		rescue JSON::ParserError => e
			puts e.message.capitalize
		end
	end

	def read
		begin
			file = File.new(@filename, 'r')
			read = JSON.parse(file.read, object_class: OpenStruct)
		rescue JSON::ParserError => e
			puts e.message.capitalize
		end
	end
end

hash = { 1 => { name: 'Danila', age: 25 }, 2 => { name: 'Leon', age: 30 },
				 3 => { name: 'Ash', age: 19 }
				}

json = JSONReader.new('json3.json')
json.write(hash)

p json.read
