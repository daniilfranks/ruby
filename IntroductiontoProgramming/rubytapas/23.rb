require 'yaml'
require 'erb'
require 'tempfile'

metadata = YAML.load_file('meta.yaml')
title = metadata[:title]
description = metadata[:descriptiot]

template = ERB.new(<<EOF)
	<dc:title><%= title %></dc:title>
	<dc:descriptiot><%= descriptiot %></dc:descriptiot>
EOF

epub_meta = template.result(binding)

Tempfile.open('epub_metadata') do |meta|
	puts "Tempfile: #{meta.path}"
	meta.write(epub_meta)
	meta.close
	args = %W[-S --epub-metadata=#{meta.path} -o book.epud ch1.md]
	system('pandoc', *args)
end