require 'httparty'
require 'awesome_print'
# http://www.rubydoc.info/github/jnunemaker/httparty/HTTParty/ClassMethods

class Post
	include HTTParty

	base_uri 'jsonplaceholder.typicode.com'

	def all
		self.class.get('/posts')
	end

	def show(param = 1)
		self.class.get("/posts/#{param}")
	end

	def create(param)
		self.class.post('/posts', param)
	end

	def update(param)
		self.class.put('/posts', param)
	end

	def delete(param = nil)
		self.class.delete("/posts/#{param}")
	end

	def show_post_comments(param = nil)
		self.class.get("/posts/#{param}/comments")
	end

	def show_post_user(param = 1)
		self.class.get("/posts?userId=#{param}")
	end
end

post = Post.new
# ap post.all
# ap post.show(9)

hash = { data: { title: 'My first title', body: 'text text text', userId: 1 } }
#ap post.create(hash)

hash2 = { data: { id: 1, title: 'My first title', body: 'text text text', userId: 1 } }
# ap post.update(hash2)

# ap post.delete(1)

# ap post.show_post_comments(1)

# ap post.show_post_user(1)