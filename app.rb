require 'rubygems'
require 'sinatra'
require './config/init'

helpers do

end

get '/' do
  haml :index
end

get '/books?' do
  @books = Book.search
  haml :books
end
