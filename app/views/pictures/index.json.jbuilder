json.array!(@pictures) do |picture|
  json.extract! picture, :id, :title, :user_id, :views
  json.url picture_url(picture, format: :json)
end
