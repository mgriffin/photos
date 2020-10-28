ENV['APP_ENV'] = 'test'

require 'rspec'
require 'rack/test'

require File.dirname(__FILE__) + '/../app'

RSpec.describe 'Photos' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'loads the root page' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'returns 404 if a photo does not exist' do
    get '/p/2020/10/halloween.jpg'
    expect(last_response.status).to eq(404)
  end

  it 'returns 404 if a thumbnail does not exist' do
    get '/t/2020/10/halloween.jpg'
    expect(last_response.status).to eq(404)
  end

  it 'returns 404 if a gallery does not exist' do
    get '/g/unknown-gallery'
    expect(last_response.status).to eq(404)
  end
end
