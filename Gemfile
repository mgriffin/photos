# frozen_string_literal: true

source 'https://rubygems.org'

gem 'dotenv'
gem 'fog-aws'
gem 'rack'
gem 'sequel'
gem 'sinatra'
gem 'sqlite3'
gem 'will_paginate', '~> 3.1.0'

group :production do
  gem 'unicorn'
end

group :development, :test do
  gem 'database_cleaner-sequel'
  gem 'factory_bot'
  gem 'rack-test'
  gem 'rspec'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'rubocop-sequel'
end
