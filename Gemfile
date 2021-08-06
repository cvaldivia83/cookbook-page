# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
gem 'sinatra'
gem 'sinatra-activerecord'
gem 'activerecord', '5.2.3', require: 'active_record'
gem 'rack'
gem 'require_all'

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
