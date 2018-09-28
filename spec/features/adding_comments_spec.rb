feature 'adding and viewing comments' do
  feature 'user can add and then view comments' do
    scenario 'a comment is added to a bookmark' do
      bookmark = Bookmarks.add(url: "http://www.makersacademy.com", title: 'Makers academy')
      visit '/bookmarks'
      first('.bookmark').click_button 'Add Comment'
      expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"
      fill_in 'comment', with: 'This is a  comment'
      click_button 'Submit'
      expect(current_path).to eq '/bookmarks'
      expect(first('.bookmark')).to have_content 'This is a comment'
    end
  end
end
