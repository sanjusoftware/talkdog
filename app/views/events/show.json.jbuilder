json.extract! @event, :id, :name, :start_at, :end_at
json.image asset_url(@event.image.url(:thumb))

