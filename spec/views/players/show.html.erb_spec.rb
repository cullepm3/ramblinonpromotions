require 'rails_helper'

RSpec.describe "players/show", type: :view do
  before(:each) do
    @player = assign(:player, Player.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
