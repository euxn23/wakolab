json.array!(@animations) do |animation|
  json.extract! animation, :id, :title, :owner, :cat, :detail, :episodes, :uid, :sid
  json.url animation_url(animation, format: :json)
end
