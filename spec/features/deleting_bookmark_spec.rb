feature 'deletion' do
  scenario 'user can delete bookmark' do
    connect_test_database
    visit '/'
    click_button 'View Bookmarks'
    first('.bookmark').click_button 'delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('makers', href: 'http://www.makersacademy.com')
  end
end
