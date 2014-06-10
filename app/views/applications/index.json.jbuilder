json.array!(@applications) do |application|
  json.extract! application, :id, :name, :reference
  json.url application_url(application, format: :json)
end
