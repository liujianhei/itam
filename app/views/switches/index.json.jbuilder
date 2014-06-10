json.array!(@switches) do |switch|
  json.extract! switch, :id, :name
  json.url switch_url(switch, format: :json)
end
