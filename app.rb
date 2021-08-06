require 'sinatra'

class App < Sinatra::Base
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
