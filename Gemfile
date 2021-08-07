# frozen_string_literal: true

source "https://rubygems.org"

ruby '2.6.6'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'activerecord', '~> 5.2', :require => 'active_record'
gem 'rack'
gem 'rake'
gem 'require_all'


group :development do
  gem 'sqlite3', '~> 1.3.6'
  gem 'pry'
end

group :production do
  gem 'pg'
end
