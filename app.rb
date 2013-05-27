require 'rubygems'
require 'sinatra'
require './config/init'

helpers do

end

get '/' do
  haml :index
end

get '/books?' do
  @books = Book.search(params)
  haml :books
end

# SASS stylesheet
get '/stylesheets/style.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :style
end