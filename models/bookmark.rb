require 'pg'

class Bookmark

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )
    else
      conn = PG.connect( dbname: 'bookmark_manager')
    end

    bookmark = conn.exec( "SELECT * FROM bookmarks" )
      bookmark.map { |row| row['url'] }
    
  end
end
