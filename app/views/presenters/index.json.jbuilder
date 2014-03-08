json.array!(@presenters) do |presenter|
  json.extract! presenter, :id, :name, :bio, :twitter_handle, :email, :talk_id
  json.url presenter_url(presenter, format: :json)
end
