ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'])

configure :development do
  set :database, 'sqlite3:db/development.sqlite'
end

configure :production do
  set :database, ENV['DATABASE_URL']
end

require_all 'app'
