# frozen_string_literal: true

require 'dotenv'
require 'fog/aws'
require 'sequel'
require 'sinatra'

Dotenv.load
DB = Sequel.connect(ENV['DATABASE_URL'])
require './lib/photos'

set :public_folder, File.dirname(__FILE__) + '/public'
before do
  headers 'X-Clacks-Overhead' => 'GNU Terry Pratchett'
end

get '/' do
  @photos = Photo.reverse(:created_at)
  erb :index
end
