feature 'testing homepage' do
  scenario 'displays title' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end
end
