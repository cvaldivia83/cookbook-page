require_relative './config/environment.rb'
require "active_record"
require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    require "./app"
  end
end

task :console do
  Pry.start
end
