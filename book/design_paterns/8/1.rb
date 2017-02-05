require 'fileutils'

class Command
	attr_reader :description

	def initialize(description)
		@description = description
	end

	def execute; end
end

class CreateFile < Command
	def initialize(path, contents)
		super("Create file: #{path}")
		@path     = path 
		@contents = contents
	end

	def execute
		File.open(@path, 'w') { |f| f.write(@contents) }
	end
end

class DeleteFile < Command 
	def initialize(path)
		super("Delete file: #{path}")
		@path = path
	end

	def execute
		File.delete(@path)
	end
end

class CopyFile < Command 
	def initialize(source, target)
		super("Copy file: #{source} to #{target}")
		@source = source
		@target = target
	end

	def execute
		FileUtils.copy(@source, @target)
	end
end

class CompositeCommand < Command
	def initialize
		@commands = []
	end

	def add_command(cmd)
		@commands << cmd
	end

	def execute
		@commands.each { |cmd| cmd.execute }
	end

	def description
		description = []
		@commands.each { |cmd| description << cmd.description }
		description.each { |i| p i }
	end
end

cmd = CompositeCommand.new

cmd.add_command(CreateFile.new('file.txt', "Hello world\n"))
cmd.add_command(CopyFile.new('file.txt', 'file2.txt'))
cmd.add_command(CopyFile.new('file2.txt', 'file3.txt'))
cmd.add_command(DeleteFile.new('file3.txt'))

cmd.execute
cmd.description
