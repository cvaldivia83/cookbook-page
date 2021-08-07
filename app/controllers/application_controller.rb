
require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/about' do
    erb :about
  end

  get '/new' do
    erb :new
  end

  get '/import' do
    erb :import
  end
end
