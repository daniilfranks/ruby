# app.rb
# rackup
# localhost:9292

class App
  def call(env)
    [200, {}, ['Hello world']]
  end
end