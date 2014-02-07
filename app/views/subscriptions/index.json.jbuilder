json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :event_id, :attendee_id
  json.url subscription_url(subscription, format: :json)
end
