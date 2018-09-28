feature 'Adding bookmarks' do
  scenario 'user add an incorrect URL' do
    connect_test_database
    visit '/bookmarks/add'
    fill_in 'url', with: 'ww.yahoo.com'
    click_button "Add a Bookmark"
    expect(page).to have_content 'URL not valid'
  end
end
