require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy all software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all
      bookmark = Bookmark.all.first

      expect(bookmarks.length).to eq 3
      expect(bookmark).to be_a Bookmark
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq 'Makers'
      expect(bookmark.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates the bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      bookmark = Bookmark.all.first
      expect(bookmark).to respond_to(:id)
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
      expect(bookmark.title).to eq 'Test Bookmark'
    end

    it 'validates the URL' do
      Bookmark.create(url: 'not a valid url', title: 'title')

      expect(Bookmark.all).not_to include 'not a valid url'
    end
  end
end
