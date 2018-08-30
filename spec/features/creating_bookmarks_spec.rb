feature 'Adding a new bookmark' do

  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    expect(page).to have_content('Test Bookmark') #is a link to the url in index.erb
  end

  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'not a real bookmark')
    fill_in('title', with: 'title here')
    click_button('Submit')
    expect(page).to have_content "Please submit a valid URL"
  end

end
