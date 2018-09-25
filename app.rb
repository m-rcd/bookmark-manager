require 'sinatra/base'
require './models/bookmark'

class BookmarkApp < Sinatra::Base
  get '/' do
erb :index
  end
    get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end
    

  run! if app_file == $0
end
