=begin
Команда (Command) — поведенческий шаблон проектирования, представляющий 
действие. Объект команды инкапсулирует в себе само действие и его 
параметры. Рассмотрим применение паттерна на примере работы с файлами.

Создадим 3 команды для создания, копирования и удаления файла. 
Классы CreateFile, CopyFile, DeleteFile соответственно
=end

class BaseComand

  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execute
    raise 'Method execute must be implemented!'
  end

  def unexecute
    raise 'Method unexecute must be implemented!'
  end
end

class CreateFile < BaseComand

  def initialize(path, content)
    super("Create file: #{path}")
    @path    = path
    @content = content
  end

  def execute
    f = File.open(@path, 'w')
    f.write(@content)
    f.close
  end

  def unexecute
    File.delete(@path) if File.exist?(@path)
  end
end

class CopyFile < BaseComand

  require 'fileutils'

  def initialize(source, target)
    super("Copy file: #{source} to #{target}")
    @source = source
    @target = target
  end

  def execute
    if File.exists?(@target)
      @content = File.read(@target)
    end
    FileUtils.copy(@source, @target)
  end

  def unexecute
    if !@content.nil?
      f = File.open(@target, 'w')
      f.write(@content)
      f.close
    else
      File.delete(@target)
    end
  end
end

class DeleteFile < BaseComand

  def initialize(path)
    super("Delete file: #{path}")
    @path = path
  end

  def execute
    if File.exists?(@path)
      @content = File.read(@path)
      File.delete(@path)
    end
  end

  def unexecute
    return if @content.empty?
    f = File.open(@path, 'w')
    f.write(@content)
    f.close
  end
end

class CompositeCommand
  def initialize
    @commands = []
  end

  def add_command(command)
    @commands << command
  end

  def up
    @commands.each { |cmd| cmd.execute }
  end

  def down
    @commands.reverse.each { |cmd| cmd.unexecute }
  end

  def description
    @commands.inject([]){ |result, cmd| result << cmd.description }.join(' -> ')
  end
end

cmds = CompositeCommand.new
cmds.add_command(CreateFile.new('file1.txt', "Hello world\n"))
cmds.add_command(CopyFile.new('file1.txt', 'file2.txt'))
cmds.add_command(DeleteFile.new('file1.txt'))

cmds.up
p cmds.description
#cmds.down