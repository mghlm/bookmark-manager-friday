ENV["RACK_ENV"] ||= "development"
# require 'data_mapper'
require 'sinatra/base'
require_relative 'data_mapper_setup'

# require './app/models/link'

class BookmarkManager < Sinatra::Base
  # enable :sessions
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url],
    title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect to('/links')
  end
  # run! if app_file == $0
end
