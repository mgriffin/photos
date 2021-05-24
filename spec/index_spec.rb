# frozen_string_literal: true

describe Index do
  let(:app) { Sinatra::Application }
  let(:response) { get '/' }

  it 'returns status 200 OK' do
    expect(response).to be_ok
  end
end
