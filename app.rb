# frozen_string_literal: true

require 'dotenv'
require 'sinatra'

Dotenv.load

set :public_folder, File.dirname(__FILE__) + '/public'
before do
  headers 'X-Clacks-Overhead' => 'GNU Terry Pratchett'
end

get '/' do
  erb :index
end
