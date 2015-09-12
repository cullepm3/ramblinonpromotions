require 'rails_helper'

RSpec.describe "teams/edit", type: :view do
  before(:each) do
    @team = assign(:team, Team.create!(
      :year => 1,
      :name => "MyString",
      :draft => 1,
      :r1 => 1,
      :r2 => 1,
      :r3 => 1,
      :r4 => 1,
      :r5 => 1,
      :r6 => 1,
      :wins => 1,
      :pts => 1,
      :low => 1,
      :earnings => 1,
      :ptschamp => 1
    ))
  end

  it "renders the edit team form" do
    render

    assert_select "form[action=?][method=?]", team_path(@team), "post" do

      assert_select "input#team_year[name=?]", "team[year]"

      assert_select "input#team_name[name=?]", "team[name]"

      assert_select "input#team_draft[name=?]", "team[draft]"

      assert_select "input#team_r1[name=?]", "team[r1]"

      assert_select "input#team_r2[name=?]", "team[r2]"

      assert_select "input#team_r3[name=?]", "team[r3]"

      assert_select "input#team_r4[name=?]", "team[r4]"

      assert_select "input#team_r5[name=?]", "team[r5]"

      assert_select "input#team_r6[name=?]", "team[r6]"

      assert_select "input#team_wins[name=?]", "team[wins]"

      assert_select "input#team_pts[name=?]", "team[pts]"

      assert_select "input#team_low[name=?]", "team[low]"

      assert_select "input#team_earnings[name=?]", "team[earnings]"

      assert_select "input#team_ptschamp[name=?]", "team[ptschamp]"
    end
  end
end
