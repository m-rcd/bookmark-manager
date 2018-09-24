class Bookmark
  attr_reader :name, :url
  LIST = ['https://www.goodreads.com/',
    'https://makers.tech']

  def initialize(name, url)
    @name = name
    @url = url
  end

  def Bookmark.all
    Bookmark::LIST
  end
end
