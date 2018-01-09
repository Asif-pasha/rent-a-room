json.array!(@bookings) do |booking|
  json.extract! booking, :id, :start_date, :end_date, :user_id, :room_id, :is_confirmed, :price
  json.url booking_url(booking, format: :json)
end
