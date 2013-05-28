require './config/init'

set :root, File.dirname(__FILE__)
set :cache, Dalli::Client.new
config_file './config/config.yml'

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