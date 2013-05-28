require 'spec_helper'
require 'benchmark'
require_relative '../app'

describe "Sinatra App" do

  it 'takes time' do
    Benchmark.realtime do
      5000.times do
        get '/books'
      end
    end.should < 60

  end

end