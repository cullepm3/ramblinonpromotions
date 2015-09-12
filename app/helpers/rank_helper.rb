module RankHelper

  def rank_subtitle
    { total_champ:     "#{filter.capitalize} players # years picked tourney winner.",
      total_earnings:  "#{filter.capitalize} players ranked by total winnings.",
      total_goat:      "#{filter.capitalize} players ranked by # years with lowest point total", 
      total_lowseed:   "#{filter.capitalize} players ranked by # years picked low seed winner.",
      total_pts_champ: "#{filter.capitalize} players ranked by # years with highest point total.",
      total_years:     "#{filter.capitalize} players ranked by # of years played.", 
      avg_draft:       "#{filter.capitalize} players ranked by average draft position.",
      avg_earnings:    "#{filter.capitalize} players ranked by average winnings.",
      avg_wins:        "#{filter.capitalize} players ranked by average games won.",
    }[sort.to_sym]
  end

  def rank_filter_options
    { active:          "Active",
      all:             "All", }
  end

  def rank_sort_options
    { total_champ:     "Champ",
      total_earnings:  "$Total",
      total_lowseed:   "Seed",
      total_goat:      "Goat",
      total_pts_champ: "Pts",
      total_years:     "Years",
      avg_draft:       "Draft",
      avg_earnings:    "$Avg",
      avg_wins:        "Wins", }
  end

  def ordered_rank_sort_keys
    [ :avg_earnings,
      :total_earnings,
      :total_champ,
      :total_lowseed,
      :total_goat,
      :total_pts_champ,
      :total_years,
      :avg_draft,
      :avg_wins, ]
  end

  def rank_active_players_path(player, options={})
    options[:filter] = "all"
    options[:anchor] = player.id
    rank_players_path(options)
  end

  def rank_all_players_path(player, options={})
    options[:filter] = "all"
    options[:anchor] = player.id
    rank_players_path(options)
  end

  def rank_all_link_to(player, sort)
    link_to(@player.rank_for(sort), rank_all_players_path(@player, sort:sort))
  end

  def rank_active_link_to(player, sort)
    link_to_if(@player.is_active?,
      @player.rank_for(sort, "active"),
      rank_active_players_path(@player, sort:sort))
  end
end