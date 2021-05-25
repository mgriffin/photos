# frozen_string_literal: true

FactoryBot.define do
  to_create(&:save)

  factory :gallery do
    slug { 'known-gallery' }
  end

  factory :photo do
    filename { '2021/03/photo.jpg' }
  end
end
