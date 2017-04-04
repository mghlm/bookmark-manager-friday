# require 'data_mapper'
require 'sinatra/base'
require './app/models/link'

class BookmarkManager < Sinatra::Base
  # enable :sessions
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end
  # run! if app_file == $0
end
