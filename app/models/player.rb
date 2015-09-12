class Player < ActiveRecord::Base
  CURRENT_YEAR = 2014

  attr_accessor :rank
  attr_accessor :tie

  def short_name
    splits = name.split(' ')
    "#{splits[0]} #{splits[-1][0]}"
  end

  def self.active
    Player.for_year(CURRENT_YEAR)
  end

  def self.for_year(year)
    Player.
      joins("inner join teams on teams.manager_id = players.id or teams.assistant_id = players.id").
      where('teams.year = ?', year).
      distinct
  end

  def is_active?
    teams.where('teams.year = ?', CURRENT_YEAR).size > 0
  end
  
  def teams
      @teams ||= Team.where("manager_id = ? or assistant_id = ?", id, id)
  end

  def image_path
    #FIXME rename image url
    "avatars/#{image_url}".split('.')[0]
  end

  def avg_wins
    total_wins/total_years.to_f
  end

  def avg_draft
    teams.sum(:draft)/total_years.to_f
  end

  def total_earnings
    teams.inject(0) do |sum, team|
      sum += team.assistant ? team.earnings/2 : team.earnings
    end
  end

  def avg_earnings
    total_earnings / total_years
  end

  def total_lowseed
    teams.lowseed.size
  end

  def total_pts_champ
    teams.ptschamp.size
  end

  def total_champ
    teams.champ.size
  end

  def total_years
    teams.size
  end

  def total_wins
    teams.sum(:wins)
  end

  def total_goat
    teams.goat.size
  end

  def total_badges_for(type)
    case type
      when :total_lowseed then total_lowseed
      when :total_pts_champ then total_pts_champ
      when :total_champ then total_champ
      when :total_goat then total_goat
      else 0
    end
  end

  def next
    players = Player.all.to_a
    players[(players.index(self) + 1) % players.size]
  end

  def prev
    players = Player.all.to_a
    players[players.index(self) - 1]
  end

  def rank_for(sort, filter="all")
    return nil if filter == "active" and !is_active?
    rankings = Leaderboard.new({filter:filter, sort:sort}).rankings
    #rankings = Leaderboard.new({filter:"all", sort:"goat"}).rankings
    puts "#{rankings.map{|u| [u.rank, u.name]}}"
    puts "#{rankings.index(self)}"
    ranked_player = rankings[rankings.index(self)]
    ranked_player.tie ? "T#{ranked_player.rank}" : "#{ranked_player.rank}"
  end

end
