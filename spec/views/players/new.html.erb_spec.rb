require 'rails_helper'

RSpec.describe "players/new", type: :view do
  before(:each) do
    assign(:player, Player.new(
      :name => "MyString",
      :years => 1,
      :wins => 1,
      :draft => 1,
      :champ => 1,
      :pts_champ => 1,
      :low_seed => 1,
      :goat => 1,
      :total => "9.99",
      :image_url => "MyString",
      :active => false,
      :wins_avg => "9.99",
      :draft_avg => "9.99",
      :total_avg => "9.99"
    ))
  end

  it "renders new player form" do
    render

    assert_select "form[action=?][method=?]", players_path, "post" do

      assert_select "input#player_name[name=?]", "player[name]"

      assert_select "input#player_years[name=?]", "player[years]"

      assert_select "input#player_wins[name=?]", "player[wins]"

      assert_select "input#player_draft[name=?]", "player[draft]"

      assert_select "input#player_champ[name=?]", "player[champ]"

      assert_select "input#player_pts_champ[name=?]", "player[pts_champ]"

      assert_select "input#player_low_seed[name=?]", "player[low_seed]"

      assert_select "input#player_goat[name=?]", "player[goat]"

      assert_select "input#player_total[name=?]", "player[total]"

      assert_select "input#player_image_url[name=?]", "player[image_url]"

      assert_select "input#player_active[name=?]", "player[active]"

      assert_select "input#player_wins_avg[name=?]", "player[wins_avg]"

      assert_select "input#player_draft_avg[name=?]", "player[draft_avg]"

      assert_select "input#player_total_avg[name=?]", "player[total_avg]"
    end
  end
end
