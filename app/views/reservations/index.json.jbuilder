json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :what, :how, :who, :with, :others, :when_from, :when_to, :span_from, :span_to, :private, :uid, :sid
  json.url reservation_url(reservation, format: :json)
end
