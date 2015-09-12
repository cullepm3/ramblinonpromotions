class Team < ActiveRecord::Base
  CURRENT_YEAR = 2014
  belongs_to :manager,  class_name: "Player"
  belongs_to :assistant,  class_name: "Player"

  scope :active, -> { where(year:CURRENT_YEAR) }
  scope :ptschamp, -> { where(ptschamp:true) }
  scope :champ, -> { where("r6 = '1'") }
  scope :lowseed, -> { where(low:true) }
  scope :goat, -> { where(goat:true) }

  validates :year, :manager, presence: true

  def partner(player)
    manager == player ? assistant : manager
  end
  
  def player_earnings
    assistant ? earnings / 2 : earnings
  end
  
  def self.years
    Team.pluck(:year)
  end
end
