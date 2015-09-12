require 'rails_helper'

RSpec.describe "teams/index", type: :view do
  before(:each) do
    assign(:teams, [
      Team.create!(
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
      ),
      Team.create!(
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
      )
    ])
  end

  it "renders a list of teams" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => 13.to_s, :count => 2
  end
end
