# frozen_string_literal: true

describe Gallery do
  let(:app) { Sinatra::Application }

  context 'when gallery is not found' do
    let(:response) { get '/g/unknown-gallery' }

    it 'returns status 404 NOT FOUND' do
      expect(response.status).to eq(404)
    end
  end
end
