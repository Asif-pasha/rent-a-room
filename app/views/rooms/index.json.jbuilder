json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :description, :price, :rules, :address, :image, :latitude, :longitude, :city_id
  json.url room_url(room, format: :json)
end
