# require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "pry-byebug"
require "better_errors"
require 'nokogiri'
require 'open-uri'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

def scrape_recipe(ingredient)
  @recipes_array = []
  @ingredient = ingredient
  url = "https://www.allrecipes.com/search/results/?search=#{@ingredient}"
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.card__detailsContainer').each do |element|
    title = element.search('.card__title').first.text.strip
    description = element.search('.card__summary').first.text.strip
    rating = element.search('.review-star-text').text.strip.slice(/(\d.?\d*)/)
    url = element.search('.card__titleLink').first.attribute('href').value

    @recipes_array << {
      title: title,
      description: description,
      rating: rating,
      url: url
    }
  end
  @recipes_array
end

def get_prep_time(array)
  new_url = array[@i.to_i][:url]
  html = URI.open(new_url).read
  new_doc = Nokogiri::HTML(html)
  @prep_time = ''
  new_doc.search('.recipe-meta-item').each do |element|
    if element.search('.recipe-meta-item-header').first.text.strip == 'total:'
      @prep_time = element.search('.recipe-meta-item-body').first.text.strip
    end
  end
  @prep_time
end

# Lists all the recipes from the cookbook
get '/' do
  @recipes = Recipe.all.order("id ASC")
  erb :index
end

#Shows info about the project
get '/about' do
  erb :about
end

# Form to create a new recipe manually
get '/new' do
  erb :new
end

# Gets post http request and creates new recipe
post '/recipes' do
  recipe = Recipe.create(
    title: params[:title],
    description: params[:description],
    prep_time: params[:prep_time],
    rating: params[:rating],
    url: ""
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

# Shows form to search for an ingredient
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
  @i = params[:index]
  scrape_recipe(@ingredient)
  get_prep_time(@recipes_array)

  @recipes_array[@i.to_i][:prep_time] = @prep_time

  recipe = Recipe.create(
    title: @recipes_array[@i.to_i][:title],
    description: @recipes_array[@i.to_i][:description],
    prep_time: @recipes_array[@i.to_i][:prep_time],
    rating: @recipes_array[@i.to_i][:rating],
    url: @recipes_array[@i.to_i][:url],
  )

  redirect to('/#all_recipes')
end

not_found do
  erb :not_found
end
