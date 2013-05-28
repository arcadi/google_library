require 'spec_helper'
require_relative '../app'
describe "Sinatra App" do

  describe "index" do
    it "should respond to GET" do
      get '/'
      last_response.should be_ok
      last_response.body.should match(/Welcome to the Great Library/)
    end

  end

  describe :books do

    it "should respond to GET" do
      get '/books'
      last_response.should be_ok
      last_response.body.should match(/Books/)
    end

    it "should return list of books" do
      get '/books'
      GOOGLE_BOOKS_RESPONSE.each { |a|
        last_response.body.should match a.title
        last_response.body.should match a.authors
      }
    end

  end

end