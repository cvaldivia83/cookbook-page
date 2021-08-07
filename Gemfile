# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '2.6.6'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'activerecord', '5.2.3', :require => 'active_record'
gem 'rack'
gem 'rake'
gem 'require_all'

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
