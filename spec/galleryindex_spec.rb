# frozen_string_literal: true

describe Gallery do
  let(:app) { Sinatra::Application }
  let(:response) { get '/' }

  context 'when you GET /' do
    it 'returns status 200 OK' do
      expect(response).to be_ok
    end
  end
end
