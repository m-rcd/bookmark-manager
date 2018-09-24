
feature 'testing homepage' do
  scenario 'displays title' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end
  context 'first bookmark' do
    scenario 'displays first bookmark - name' do
      visit('/')
      expect(page).to have_content('Goodreads')
    end
    
    scenario 'displays first bookmark - url' do
      visit('/')
      expect(page).to have_content('https://www.goodreads.com/')
    end

    scenario 'first bookmark url link is correct' do
      visit('/')
      expect(page).to have_selector(:css, 'a[href="https://www.goodreads.com/"]')
    end
  end

  context 'second bookmark' do
    scenario 'displays second bookmark - name' do
      visit('/')
      expect(page).to have_content('Makers Academy')
    end

    scenario 'displays second bookmark - url' do
      visit('/')
      expect(page).to have_content('https://makers.tech')
    end

    scenario 'first bookmark url link is correct' do
      visit('/')
      expect(page).to have_selector(:css, 'a[href="https://makers.tech"]')
    end
  end
end
