# frozen_string_literal: true

require 'dotenv'
require 'fog/aws'
require 'sequel'
require 'sinatra'
require 'will_paginate'
require 'will_paginate/sequel'

Dotenv.load

configure :production, :development do
  DB = Sequel.connect(ENV['DATABASE_URL'])
end

configure :test do
  DB = Sequel.connect('sqlite://db/photos_test.db')
end

DB.extension(:pagination)
require './lib/photos'

set :public_folder, File.dirname(__FILE__) + '/public'
before do
  headers 'X-Clacks-Overhead' => 'GNU Terry Pratchett'
end

get '/' do
  page = params.fetch :page, 1
  @photos = Photo
            .where(gallery_id: nil)
            .reverse(:created_at)
            .paginate(page.to_i, 10)
  erb :index
end

get '/p/:year/:month/*' do
  photo = Photo
          .where(filename: "#{params[:year]}/#{params[:month]}/#{params[:splat].first}")
          .first
  return not_found if photo.nil?

  photo.image
end

get '/t/:year/:month/*' do
  photo = Photo
          .where(filename: "#{params[:year]}/#{params[:month]}/#{params[:splat].first}")
          .first
  return not_found if photo.nil?

  photo.thumb
end

get '/g/:slug' do
  @gallery = Gallery.where(slug: params[:slug]).first
  return not_found if @gallery.nil?

  erb :gallery
end

not_found do
  status 404
  erb :oops
end
