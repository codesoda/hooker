json.array!(@calls) do |call|
  json.extract! call, :id, :hook_id, :event_type, :data
  json.url call_url(call, format: :json)
end
