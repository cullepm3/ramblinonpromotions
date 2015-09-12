class Badge
  attr_accessor :image_url, :type

  def initialize(type, image_url)
    @image_url = image_url
    @type = type
  end

  def self.all
    @badges ||= [
      Badge.new(:total_pts_champ, "ptscrown_sm.png"),
      Badge.new(:total_champ, "crown_sm.png"),
      Badge.new(:total_lowseed, "acorn_sm.png"),
      Badge.new(:total_goat, "goat_sm.png") ]
  end

  def self.index_for_type(type)
    Badge.all.each_with_index do |badge, index|
      return index if badge.type == type.to_sym
    end
    nil
  end

  def self.ordered(sort)
    if index = Badge.index_for_type(sort)
      Badge.all[0], Badge.all[index] = Badge.all[index], Badge.all[0]
    end
    Badge.all
  end

  def self.for_sort(sort)
    if Badge.index_for_type(sort)
      Badge.all[Badge.index_for_type(sort)]
    end
  end
end