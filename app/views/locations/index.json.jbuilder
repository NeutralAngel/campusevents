json.array!(@locations) do |location|
  json.extract! location, :id, :name, :description, :latitude, :longitude, :map_url
  json.url location_url(location, format: :json)
end
