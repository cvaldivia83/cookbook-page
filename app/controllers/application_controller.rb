
require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @recipes = Recipe.all.order("id ASC")
    erb :index
  end

  get '/about' do
    erb :about
  end

  get '/new' do
    erb :new
  end

  post '/recipes' do
    recipe = Recipe.create(
    title: params[:title],
    description: params[:description],
    prep_time: params[:prep_time],
    rating: params[:rating]
  )
  redirect to('/#all_recipes')
  end

  get '/import' do
    erb :import
  end
end
