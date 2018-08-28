feature "Viewing bookmarks" do
  scenario "View list of bookmarks" do
    visit("/bookmarks")
    expect(page).to have_content "https://www.makersacademy.com"
    expect(page).to have_content "https://www.google.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "https://www.twitter.com"
  end
end
