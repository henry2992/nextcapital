json.array!(@bowlers) do |bowler|
  json.extract! bowler, :id, :name
  json.url bowler_url(bowler, format: :json)
end
