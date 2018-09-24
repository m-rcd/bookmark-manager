
feature 'testing homepage' do
  scenario 'displays title' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end
end

feature 'testing bookmarks' do
  before do
    visit('/')
    click_button 'See Bookmarks'
  end

  context 'first bookmark' do

    # scenario 'displays first bookmark - name' do
    #   expect(page).to have_content('https://www.goodreads.com/')
    # end

    scenario 'displays first bookmark - url' do
      expect(page).to have_content('https://www.goodreads.com/')
    end

    scenario 'first bookmark url link is correct' do
      expect(page).to have_selector(:css, 'a[href="https://www.goodreads.com/"]')
    end
  end

  context 'second bookmark' do
    # scenario 'displays second bookmark - name' do
    #   expect(page).to have_content('https://makers.tech')
    # end

    scenario 'displays second bookmark - url' do
      expect(page).to have_content('https://makers.tech')
    end

    scenario 'first bookmark url link is correct' do
      expect(page).to have_selector(:css, 'a[href="https://makers.tech"]')
    end
  end
end
