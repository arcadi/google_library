require_relative '../config/init'
require 'rspec'
require 'rack/test'

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  Sinatra::Application
end

require_relative "support/google_books_response"

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.before(:each) do
    GoogleBooks.stub!(:search).and_return(GOOGLE_BOOKS_RESPONSE)
  end
end