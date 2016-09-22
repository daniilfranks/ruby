require 'sinatra'
require 'movie'

#ruby -I lib myapp.rb
#localhost:4567

get '/' do
  'Hello world!'
end

get '/movies' do 
	@movies = ["Javs","Alien","Terminator 2"]
	erb :index
end

get '/movies/new' do   
	erb :new 
end

post '/movies/create' do   
	@movie = Movie.new   
	@movie.title = params['title']   
	@movie.director = params['director']   
	@movie.year = params['year']  
end 
