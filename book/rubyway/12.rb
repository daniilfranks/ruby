require 'forwardable'

class Post
	attr_reader :id, :title, :description

	def initialize(id, title, description)
		@id          = id
		@title       = title
		@description = description
	end

	def show_post
		puts content
	end

	private

	def head
		"===== Create at: #{Time.new} ====="
	end

	def body
		raise 'Body is empty!!!'
	end

	def footer
		'=' * 40
	end

	def content
		[head, body, footer].join("\n")
	end
end

class PostSingleArray < Post
	extend Forwardable

	def_delegators :@post, :id, :title, :description

	def initialize(post)
		@post  = post
		@array = []
	end

	def add_array
		@array << "#{id}, #{title}, #{description}"
	end

	private

	def body
		@array.each { |arr| arr }
	end
end

class PostMultiArray < Post
	extend Forwardable

	def_delegators :@post, :id, :title, :description

	def initialize(*post)
		@post  = post
		@array = []
	end

	def add_array
		@post.each { |post| @array << "#{post.id}, #{post.title}, #{post.description}" }
	end

	private

	def body
		@array.each { |arr| arr }
	end
end

post1 = Post.new(1, 'First', 'text text text')
p post1

post_array1 = PostSingleArray.new(post1)
post_array1.add_array
post_array1.show_post

puts

post2 = Post.new(2, 'Two', 'text text text')
p post2

post_array2 = PostMultiArray.new(post1, post2)
post_array2.add_array
post_array2.show_post
