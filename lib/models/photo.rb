# frozen_string_literal: true

# A model class for photos
class Photo < Sequel::Model
  many_to_one :gallery
  def aws
    @aws ||= Fog::Storage.new({
                                provider: 'AWS',
                                aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                                region: ENV['AWS_REGION']
                              })
  end

  def image
    aws
      .directories
      .new(key: ENV['AWS_BUCKET'])
      .files
      .get(filename)
      .body
  end

  def thumb
    aws
      .directories
      .new(key: ENV['AWS_BUCKET'])
      .files
      .get("t/#{filename}")
      .body
  end
end
