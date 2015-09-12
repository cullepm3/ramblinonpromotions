json.array!(@teams) do |team|
  json.extract! team, :id, :year, :name, :draft, :r1, :r2, :r3, :r4, :r5, :r6, :wins, :pts, :low, :earnings, :ptschamp
  json.url team_url(team, format: :json)
end
