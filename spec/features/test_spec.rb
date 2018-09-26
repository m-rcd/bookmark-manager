
    feature 'testing homepage' do
      scenario 'displays title' do
        visit('/')
        expect(page).to have_content('Bookmark Manager')
      end
    end

    feature 'viewing bookmarks' do
      scenario 'user can see bookmarks' do
        visit('/bookmarks')
        expect(page).to have_content('http://www.makersacademy.com')
        expect(page).to have_content('http://www.destroyallsoftware.com')
        expect(page).to have_content('http://www.google.com')

      end
    end
