json.array!(@hooks) do |hook|
  json.extract! hook, :id, :url
  json.url hook_url(hook, format: :json)
end
