require 'rubygems'
require 'sinatra'

class App < Sinatra::Application
  set :bind, '0.0.0.0'
  get '/' do
    "Hello, World!"
  end
end
