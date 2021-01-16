json.array!(@events) do |event|
  json.extract! event, :studio_id, :name, :place
  json.start event.start_at
  json.end event.end_at
  json.url event_url(event, format: :html)
end
