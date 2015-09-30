json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :title, :message, :user_id
  json.url tweet_url(tweet, format: :json)
end
