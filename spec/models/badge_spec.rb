require 'rails_helper'

RSpec.describe Badge, type: :model do
  describe ".ordered" do
    it "returns array with specified type first" do
      badges = Badge.ordered("total_lowseed")
      expect(badges.first.type).to eql(:total_lowseed)
      expect(badges.uniq{|b| b.type}.size).to eql(Badge.all.size)
    end

    it "returns array with all types" do
      badges = Badge.ordered("total_lowseed")
      expect(badges.first.type).to eql(:total_lowseed)
      expect(badges.uniq{|b| b.type}.size).to eql(Badge.all.size)
    end
    
    context "when sort isn't recognized" do
      it "returns default order" do
        expect(Badge.ordered("bogo")).to match_array(Badge.all)
      end
    end

    context "when sort isn't set" do
      it "returns default order" do
        expect(Badge.ordered("")).to match_array(Badge.all)
      end
    end

  end

end
