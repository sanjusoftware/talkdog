json.array!(@ratings) do |rating|
  json.extract! rating, :id, :value, :time, :talk_id
  json.url rating_url(rating, format: :json)
end
