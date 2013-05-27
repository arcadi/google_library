require 'rubygems'
require 'sinatra'

helpers do

end

get '/' do
  haml :index
end

get '/books?' do
  haml :books
end
