class Leaderboard

  attr_accessor :rankings
  attr_accessor :params

  def initialize(params={})
    @params = params
    if params[:filter] == "all"
      @players = Player.all
    else
      @players = Player.active
    end

    @rankings = sort

    rank
  end

  def method_for_sort
    case params[:sort]
      when "total_years" then :total_years
      when "avg_wins" then :avg_wins
      when "total_lowseed" then :total_lowseed
      when "total_pts_champ" then :total_pts_champ
      when "total_champ" then :total_champ
      when "total_goat" then :total_goat
      when "avg_draft" then :avg_draft
      when "total_earnings" then :total_earnings
      when "avg_earnings" then :avg_earnings
      else
        :avg_earnings
    end
  end

  def sort
    players = @players.to_a.sort{|p1, p2| p1.send(method_for_sort) <=> p2.send(method_for_sort)}
    unless params[:sort] == "avg_draft"
      players = players.reverse
    end
    players
  end

  def rank
    r = 1
    last_player = @rankings.first
    last_player.rank = r
    @rankings[1..-1].each_with_index do |player, index|
      if player.send(method_for_sort) == last_player.send(method_for_sort)
        last_player.tie = true
        player.tie = true
        player.rank = r
      else
        #r = r+1
        r = index+2
        player.tie = false
        player.rank = r
      end
      last_player = player
    end
    @rankings
  end
end
