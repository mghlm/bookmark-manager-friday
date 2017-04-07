ENV["RACK_ENV"] ||= "development"
# require 'data_mapper'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

# require './app/models/link'

class BookmarkManager < Sinatra::Base
   enable :sessions
   register Sinatra::Flash
   set :session_secret, 'super secret'

  get '/links' do
    @links = Link.all
    @email = current_user.email if current_user
    erb :'/links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  # get 'user' do
  #   erb :'user/index'
  # end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = params[:tags].split
    tag.each { |tag| link.tags << Tag.first_or_create(name: tag) }
    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/user/new' do
    flash[:error] = "Password and confirmation password do not match"
    flash[:error] 
    redirect '/links' if current_user
    erb :'user/new'
  end

  post '/user' do
      user = User.create(email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation])
      session[:id] = user.id
      redirect to('/user/new')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end

end
