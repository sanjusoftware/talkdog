json.array!(@events) do |event|
  json.extract! event, :id, :name, :start_at, :end_at
  json.image event.image.url(:thumb)
  json.url event_url(event, format: :json)
end
