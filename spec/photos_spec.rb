# frozen_string_literal: true

describe Photo do
  let(:app) { Sinatra::Application }

  before do
    Fog.mock!
    Fog::Mock.reset

    dir = described_class.new.aws.directories.create(
      key: ENV['AWS_BUCKET']
    )
    dir.files.create(key: '2020/10/known.jpg')
  end

  context 'when photo is found' do
    before do
      described_class.create(filename: '2020/10/known.jpg')
    end

    let(:response) { get '/p/2020/10/known.jpg' }

    it 'returns status 200 OK' do
      expect(response).to be_ok
    end
  end

  context 'when photo is not found' do
    let(:response) { get '/p/2020/10/unknown.jpg' }

    it 'returns status 404 NOT FOUND' do
      expect(response.status).to eq(404)
    end
  end
end
