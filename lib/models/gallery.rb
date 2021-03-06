# frozen_string_literal: true

Sequel::Model.plugin :timestamps

# A model class for galleries
class Gallery < Sequel::Model
  many_to_one :user
  one_to_many :photos
end
