class Bookmark
 LIST = []
  def initialize
    LIST << self
  end

  def Bookmark.all
    LIST
  end
end
