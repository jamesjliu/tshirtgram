json.array!(@sales) do |sale|
  json.extract! sale, :id, :email, :user_id, :picture_id, :amount, :size, :address, :country, :strip_id, :stripe_token, :card_expiration
  json.url sale_url(sale, format: :json)
end
