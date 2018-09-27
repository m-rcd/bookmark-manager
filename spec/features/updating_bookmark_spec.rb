feature "Updating" do
  scenario "user updates a bookmark" do
    visit '/bookmarks'
    click_button 'Add a Bookmark'
    fill_in 'url', with: 'https://www.google.com'
    fill_in 'title', with: 'Bing'
    click_button 'Add a Bookmark'
    first('.bookmark').click_button 'Update'

    fill_in 'url', with: 'https://www.alexiscool.com'
    fill_in 'title', with: 'No Hes not'
    click_button 'Submit'
    expect(current_path).to eq '/bookmarks'

    expect(page).not_to have_link("Bing", href: 'https://www.google.com')
    expect(page).to have_link("No Hes not", href: 'https://www.alexiscool.com')
  end
end
