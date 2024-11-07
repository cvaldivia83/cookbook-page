require 'bundler/setup'
require 'sinatra/activerecord'
 Bundler.require

configure :development do
  ENV['SINATRA_ENV'] ||= "development"

  require 'bundler/setup'
  Bundler.require(:default, ENV['SINATRA_ENV'])

  # ActiveRecord::Base.establish_connection(
  #  :adapter => "sqlite3",
  #  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
  # )

  set :database, {:adapter =>'sqlite3', :database=>"db/#{ENV['SINATRA_ENV']}.sqlite"}
 end

 configure :production do
  
  set :database, { adapter: 'postgres', database: 'cookbook_db_rdz2'}

  # set :database, { 
  #   adapter: db.scheme == 'postgres' ? 'postgresql' : db.scheme, 
  #   host: db.host,
  #   username: db.user,
  #   password: db.password,
  #   database: db.path[1..-1],
  #   encoding: 'utf8'
  # }
 end

require_all 'app'
