json.array!(@talks) do |talk|
  json.extract! talk, :id, :name, :event_id, :abstract, :start_at, :end_at, :download_link, :attendance
  json.url talk_url(talk, format: :json)
end
