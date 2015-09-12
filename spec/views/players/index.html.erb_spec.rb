require 'rails_helper'

RSpec.describe "players/index", type: :view do
  before(:each) do
    assign(:players, [
      Player.create!(
        :name => "Name",
        :years => 1,
        :wins => 2,
        :draft => 3,
        :champ => 4,
        :pts_champ => 5,
        :low_seed => 6,
        :goat => 7,
        :total => "9.99",
        :image_url => "Image Url",
        :active => false,
        :wins_avg => "9.99",
        :draft_avg => "9.99",
        :total_avg => "9.99"
      ),
      Player.create!(
        :name => "Name",
        :years => 1,
        :wins => 2,
        :draft => 3,
        :champ => 4,
        :pts_champ => 5,
        :low_seed => 6,
        :goat => 7,
        :total => "9.99",
        :image_url => "Image Url",
        :active => false,
        :wins_avg => "9.99",
        :draft_avg => "9.99",
        :total_avg => "9.99"
      )
    ])
  end

  it "renders a list of players" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
