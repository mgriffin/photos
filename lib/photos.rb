Dir['./lib/models/*.rb'].each do |file|
  puts file
  require file
end
