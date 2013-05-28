require 'spec_helper'

describe "Book" do

  describe "initialize" do

    it "should create book" do
      params = {
        :title => "Title",
        :authors => "Author1, Author2",
        :thumbnail => "http://example.com/image.png"
      }

      book = Book.new(params)
      book.title.should == params[:title]
      book.authors.should == params[:authors]
      book.thumbnail.should == params[:thumbnail]
    end

  end

  describe "search" do
    before do
      app.settings.cache.flush_all
    end
    let(:books) { Book.search }

    it "should return list of books" do
      books.should be_a WillPaginate::Collection
    end

    it "should return 2 items" do
      books.size.should be 2
    end

    it "should return 5 total entries" do
      books.total_entries.should be 5
    end

    it "should return books" do
      books.first.should be_a Book
    end

  end

end