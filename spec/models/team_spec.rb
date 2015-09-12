require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:manager) { create(:player, name:"Skip Prosser")}
  let(:assistant) { create(:player, name:"Tim Duncan")}
  let(:team) { create( :team, manager:manager, assistant:assistant) }
  let(:single_player_team) { create(:team, manager:manager)}

  describe "#partner" do
    it "returns other player" do
      expect(team.partner(manager)).to eql(assistant)
      expect(team.partner(assistant)).to eql(manager)
    end
    context "when single player" do
      it "returns nil" do
        expect(single_player_team.partner(manager)).to be_nil
      end
    end
  end
  
  describe "#player_earnings" do
    it "returns split earnings" do
      expect(team.player_earnings).to eql(team.earnings/2)
    end
    context "when single player" do
      it "returns total earnings" do
        expect(single_player_team.player_earnings).to eql(team.earnings)
      end
    end
  end

end
