# frozen_string_literal: true

require 'dotenv'
require 'fog/aws'
require 'sequel'
require 'sinatra'
require 'will_paginate'
require 'will_paginate/sequel'

Dotenv.load
DB = Sequel.connect(ENV['DATABASE_URL'])
DB.extension(:pagination)
require './lib/photos'

set :public_folder, File.dirname(__FILE__) + '/public'
before do
  headers 'X-Clacks-Overhead' => 'GNU Terry Pratchett'
end

get '/' do
  page = params.fetch :page, 1
  @photos = Photo.reverse(:created_at).paginate(page.to_i, 10)
  erb :index
end

get '/p/:year/:month/:photo' do
  Photo
    .where(filename: "#{params[:year]}/#{params[:month]}/#{params[:photo]}")
    .first
    .image
end

get '/t/:year/:month/:photo' do
  Photo
    .where(filename: "#{params[:year]}/#{params[:month]}/#{params[:photo]}")
    .first
    .thumb
end

get '/g/:slug' do
  @gallery = Gallery.where(slug: params[:slug]).first
  p @gallery
  erb :gallery
end
