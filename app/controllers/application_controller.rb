require './config/environment'
require 'nokogiri'
require 'open-uri'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # method to scrape ingredients from the web
  def scrape_recipe(ingredient)
    @recipes_array = []
    ingredient = ingredient
    url = "https://www.allrecipes.com/search?q=#{ingredient}"

    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search('.mntl-card.card').first(5).each do |item|
      title = item.search('.card__title-text').text
      url = item.attribute('href').value
      @recipes_array << { title: title, url: url }
    end

    @recipes_array
  end


  def get_details(array, index)
    new_url = array[index][:url]
    html = URI.open(new_url).read
    new_doc = Nokogiri::HTML(html)

    rating = new_doc.search('.mm-recipes-review-bar__rating').text

    description = new_doc.search('.article-subheading').text

    prep_time = ''

    new_doc.search('.mm-recipes-details__item').each do |card|
      if card.search('.mm-recipes-details__label').text.include?('Total Time:')
        prep_time = card.search('.mm-recipes-details__value').text
      end  
    end
    { rating: rating, description: description, prep_time: prep_time }
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

  # Creates a new recipe
  post '/recipes' do
    Recipe.create(
      title: params[:title],
      description: params[:description],
      prep_time: params[:prep_time],
      rating: params[:rating]
    )
  redirect to('/#all_recipes')
  end

  # Deletes the chosen recipe
  get '/recipes/:id' do
    index = params[:id]
    recipe = Recipe.find_by(id: index)
    recipe.destroy
    redirect to('/#all_recipes')
  end

  get '/import' do
    erb :import
  end

  # Marks recipe as done
  get '/recipe/:id' do
    index = params[:id]
    recipe = Recipe.find_by(id: index)
    recipe.done = true
    recipe.save
    redirect to('/#all_recipes')
  end

  # Imports recipes from the web and lists them
  post '/ingredients' do
    @ingredient = params[:ingredient]
    scrape_recipe(@ingredient)
    erb :ingredients
  end

# Searches for the recipe prep time
# Adds the imported recipe to the cookbook db
  get '/ingredients/:index/:ingredient' do
    @ingredient = params[:ingredient]
    @i = params[:index].to_i

    @recipes_array = scrape_recipe(@ingredient)

    details = get_details(@recipes_array, @i)

    Recipe.create(
      title: @recipes_array[@i][:title],
      description: details[:description],
      prep_time: details[:prep_time],
      rating: details[:rating]
    )

    redirect to('/#all_recipes')
  end

  not_found do
    erb :not_found
  end
end
