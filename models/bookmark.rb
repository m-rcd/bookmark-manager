require 'pg'

class Bookmark

  def self.all
    conn = PG.connect( dbname: 'bookmark_manager', user: 'mariannerachid' )
    bookmark = conn.exec( "SELECT * FROM bookmarks" )
      bookmark.map do | row |
        row['url']
      end
  end
end
