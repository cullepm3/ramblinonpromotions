json.array!(@players) do |player|
  json.extract! player, :id, :name, :years, :wins, :draft, :champ, :pts_champ, :low_seed, :goat, :total, :image_url, :active, :wins_avg, :draft_avg, :total_avg
  json.url player_url(player, format: :json)
end
