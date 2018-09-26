require 'pg'
feature 'viewing bookmarks' do
  scenario 'user can see bookmarks' do
    visit('/bookmarks')

    con = PG.connect :dbname => 'bookmark_manager_test'

    con.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    con.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    con.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit '/'
    click_button "View Bookmarks"
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
    expect(page).to have_content('http://www.google.com')
  end
end
