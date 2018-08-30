require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do

    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy all software")
    Bookmark.create(url: "http://www.google.com", title: "Google")

    visit('/bookmarks')

    expect(page).to have_content "Makers"
    expect(page).to have_content "Destroy all software"
    expect(page).to have_content "Google"
  end
end
