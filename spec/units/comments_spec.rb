require './models/comments'
require './models/bookmarks'

describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      bookmark = Bookmarks.add(url: "http://www.makersacademy.com", title: "Makers Academy")
      comment = Comment.create(text: 'This is a comment', bookmark_id: bookmark.id)

      expect(comment).to be_a Comment
      expect(comment).to respond_to :id
      expect(comment.text).to eq 'This is a comment'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end

  describe '.where' do
    it 'gets the relevant comments from the database' do
      bookmark = Bookmarks.add(url: "http://www.makersacademy.com", title: 'Makers Academy')
      comment = Comment.create(text: 'This is a comment', bookmark_id: bookmark.id)
      Comment.create(text: 'This is another comment', bookmark_id: bookmark.id)

      comments = Comment.where(bookmark_id: bookmark.id)
      comment = comments.first

      expect(comments.length).to eq 2
      expect(comment).to respond_to :id
      expect(comment.text).to eq 'This is a comment'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end
end
