require 'sinatra/base'
require 'sinatra/flash'
require './models/bookmarks'

class BookmarkApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks' do
    if Bookmarks.valid_url?(params['url'])
      Bookmarks.add(url: params['url'])
    else
      flash[:alert] = "URL not valid"
    end
    redirect '/bookmarks'
  end

  post '/bookmarks/add' do
    redirect '/bookmarks'
  end

  get '/bookmarks/add' do
    erb :add_bookmark
  end

  run! if app_file == $0
end
