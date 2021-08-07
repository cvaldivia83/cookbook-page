# frozen_string_literal: true

source "https://rubygems.org"

ruby '2.6.6'
gem 'sinatra'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'activerecord', '5.2.3', :require => 'active_record'
gem 'rack'
gem 'require_all'
gem 'sqlite3'

group :development do
  # gem 'sqlite3'
  gem 'pry'
end

group :production do
  gem 'pg'
end

group :development, :production do
  gem 'rake'
end
