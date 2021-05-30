# frozen_string_literal: true

describe Photo do
  let(:app) { Sinatra::Application }

  before do
    Fog.mock!
    Fog::Mock.reset

    dir = described_class.new.aws.directories.create(
      key: ENV['AWS_BUCKET']
    )
    dir.files.create(key: "t/#{attributes_for(:photo)[:filename]}")
  end

  context 'when thumbnail is found' do
    before do
      create(:photo)
    end

    let(:response) { get "/t/#{attributes_for(:photo)[:filename]}" }

    it 'returns status 200 OK' do
      expect(response).to be_ok
    end
  end

  context 'when thumbnail is not found' do
    let(:response) { get '/t/2020/10/unknown.jpg' }

    it 'returns status 404 NOT FOUND' do
      expect(response.status).to eq(404)
    end
  end
end
