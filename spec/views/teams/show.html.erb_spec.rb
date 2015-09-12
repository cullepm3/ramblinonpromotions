require 'rails_helper'

RSpec.describe "teams/show", type: :view do
  before(:each) do
    @team = assign(:team, Team.create!(
      :year => 1,
      :name => "Name",
      :draft => 2,
      :r1 => 3,
      :r2 => 4,
      :r3 => 5,
      :r4 => 6,
      :r5 => 7,
      :r6 => 8,
      :wins => 9,
      :pts => 10,
      :low => 11,
      :earnings => 12,
      :ptschamp => 13
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/12/)
    expect(rendered).to match(/13/)
  end
end
