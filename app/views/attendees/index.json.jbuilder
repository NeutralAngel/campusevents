json.array!(@attendees) do |attendee|
  json.extract! attendee, :id, :first_name, :last_name, :email
  json.url attendee_url(attendee, format: :json)
end
