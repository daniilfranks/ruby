require 'yaml/store'
require 'fileutils'

class MyYAML
	def initialize(file)
		@file  = file
		@store = YAML::Store.new(file)
		@array = []
	end

	def write(id)
		@array << id
		@store.transaction do 
			@store[:apikey] = @array
		end
	end

	def read
		array = []
		@store.transaction(true) do
			@store.roots.each do |r|
				array = @store[r]
			end
		end
		array
	end

	def remove
		FileUtils.rm(@file)
	end
end

yaml = MyYAML.new('yaml3.yml')
yaml.write('first string')
yaml.write('Yaml file')

p yaml.read

yaml.remove
