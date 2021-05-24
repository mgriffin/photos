# frozen_string_literal: true

describe Thumbnail do
  let(:app) { Sinatra::Application }

  context 'when thumbnail is not found' do
    let(:response) { get '/t/2020/10/unknown.jpg' }

    it 'returns status 404 NOT FOUND' do
      expect(response.status).to eq(404)
    end
  end
end
