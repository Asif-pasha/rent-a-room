json.array!(@special_prices) do |special_price|
  json.extract! special_price, :id, :room_id, :start_date, :end_date, :price
  json.url special_price_url(special_price, format: :json)
end
