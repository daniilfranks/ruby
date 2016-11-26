# Пространство имен для нескольких методов полезных файлов для копирования, перемещения, удаления и т.д.

require 'fileutils'

begin
  FileUtils.cd('fileutils')
  File.open('fileutils.txt', 'w') do |w|
    w.write("#{Time.new}\n")
    w.write('Hi file.')
  end
rescue Errno::ENOENT => e
  puts e.message
end

p FileUtils.pwd

#p FileUtils.mkdir('newdirectory')

# create directory
#p FileUtils.mkdir('del')

# delete directory
p FileUtils.rmdir('del')

#copy file
p FileUtils.cp(%w(text.txt text2.txt), 'newdirectory')

#rename
#p FileUtils.mv('name', 'newname')
#p FileUtils.mv('text3.txt', 'newname3.txt')

#remove
#p FileUtils.rm('newname3.txt')

p FileUtils.chmod(0755, 'text.txt')

# install перезапишет файлы
p FileUtils.install('original.rb', 'original', :verbose => true)