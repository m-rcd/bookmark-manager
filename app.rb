require 'sinatra/base'
require 'sinatra/flash'
require './models/bookmarks'

class BookmarkApp < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  post '/bookmarks' do
    if Bookmarks.valid_url?(params['url'])
      Bookmarks.add(url: params['url'], title: params['title'])
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

  delete '/bookmarks/:id' do
   Bookmarks.delete(id: params['id'])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark_id = params[:id]
    @bookmark = Bookmarks.find(id: params[:id])
    erb :update_bookmark
  end

  patch '/bookmarks/:id' do
    Bookmarks.update(id: params[:id], title: params[:title], url: params[:url])
      redirect '/bookmarks'
  end

  run! if app_file == $0
end
