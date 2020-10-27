# frozen_string_literal: true

# A model class for galleries
class Gallery < Sequel::Model
  one_to_many :photos
end
