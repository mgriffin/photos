# frozen_string_literal: true

Dir['./lib/models/*.rb'].sort.each do |file|
  require file
end
