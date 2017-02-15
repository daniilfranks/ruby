class Post
	attr_accessor :id, :title, :description

	def initialize(id, title, description)
		@id          = id          || nil
		@title       = title       || 'Title default'
		@description = description || nil
	end
end

class AddFile
	def initialize(file)
		@file = File.new(file, 'w+')
		@array = []
	end

	def add_to_array(*post)
		@array << post
	end

	def run
		@array[0].each { |k| @file.write("#{k.id}, #{k.title}, #{k.description}\n") }
	end

	def to_s
		@array
	end
end

post1 = Post.new(1, 'First', 'text text text')
post2 = Post.new(2, 'Cat', 'text text text')
post3 = Post.new(3, 'Dog', 'text text text')
p post1

file1 = AddFile.new('post_array.txt')
p file1
file1.add_to_array(post1, post2, post3)
p file1.to_s

file1.run
