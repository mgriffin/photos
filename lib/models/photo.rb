# frozen_string_literal: true

class Photo < Sequel::Model
  def aws
    @aws ||= Fog::Storage.new({
                                provider: 'AWS',
                                aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                                region: ENV['AWS_REGION']
                              })
  end

  def url
    aws
      .directories
      .new(key: ENV['AWS_BUCKET'])
      .files
      .get(filename)
      .url(Time.now.to_i + 10)
  end

  def image
    aws
      .directories
      .new(key: ENV['AWS_BUCKET'])
      .files
      .get(filename)
      .body
  end
end
