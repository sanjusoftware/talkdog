json.array!(@talks) do |talk|
  json.extract! talk, :id, :name, :event_id, :abstract, :start_at, :end_at, :download_link, :attendance
  json.url event_talk_url(talk.event_id, talk, format: :json)
end
