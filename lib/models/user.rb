# frozen_string_literal: true

Sequel::Model.plugin :timestamps

# A model class for photos
class User < Sequel::Model
  one_to_many :photos
  one_to_many :galleries
end
