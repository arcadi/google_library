require 'googlebooks'
class Book
  attr_reader :authors, :title, :thumbnail

  def initialize(args)
    args.each do |k, v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  class << self

    def search(query="Ruby on Rails", params={})
      options = handle_search_options(params)
      response = GoogleBooks.search(query, options)
      books = response.map { |book| self.new(handle_google_book(book)) }
      books
    end

    private

    def handle_google_book(item)
      {
        :title => item.title,
        :authors => item.authors.size > 0 ? item.authors : nil,
        :thumbnail => item.image_link
      }
    end

    def handle_search_options(params)
      {
        :page => params[:page] || 1,
        :count => params[:per_page] || 20,
        :country => params[:country] || "us",
        :api_key => "AIzaSyApfbQ8ByIK99wF7SKDtsiz9mmKp7TNFqQ"
      }
    end

  end

end