class Book
  attr_reader :authors, :title, :thumbnail

  def initialize(args)
    args.each do |k, v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  class << self

    def search(params={})
      options = handle_search_params(params)
      cache.fetch(cache_key(options), settings.cache_ttl) do
        books, total_items = google_books_search(options)
        books = WillPaginate::Collection.create(options[:page], options[:per_page], total_items) do |pager|
          pager.replace books
        end
        books
      end
    end

    private

    def cache_key(params)
      "#{params[:query]}:#{params[:page]}"
    end

    def google_books_search(params)
      response = GoogleBooks.search(params[:query], handle_google_search_params(params))
      books = response.map { |book| self.new(handle_google_book(book)) }
      [books, response.total_items]
    end

    def handle_google_search_params(params)
      {
        :page => params[:page],
        :count => params[:per_page],
        :country => params[:country],
        :api_key => settings.api_key
      }
    end


    def handle_google_book(item)
      {
        :title => item.title,
        :authors => item.authors.size > 0 ? item.authors : nil,
        :thumbnail => item.image_link || "/images/blank_book.jpg"
      }
    end

    def handle_search_params(params)
      {
        :query => params[:query] || "Ruby on Rails",
        :page => params[:page] ? params[:page].to_i : 1,
        :per_page => params[:per_page] ? params[:per_page].to_i : settings.per_page,
        :country => params[:country]|| settings.country
      }
    end

    def settings
      Sinatra::Application.settings
    end

    def cache
      settings.cache
    end

  end

end