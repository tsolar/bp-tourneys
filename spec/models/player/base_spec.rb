require "rails_helper"

RSpec.describe Player::Base, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:nickname).scoped_to(:name) }
    it { should validate_uniqueness_of(:name) }

    let(:nickname) { FFaker::Lorem.word }
    let(:player) { FactoryBot.build(:player_basis, nickname: nickname) }

    context "when nickname is present" do
      it "should not validate name uniqueness" do
        expect(player).not_to validate_uniqueness_of(:name)
      end
    end

    context "when nickname is not present" do
      let(:nickname) { nil }

      it "should validate name uniqueness" do
        expect(player).to validate_uniqueness_of(:name)
      end
    end
  end

  describe "relationships" do
    it {
      should have_many(:tournament_team_players)
        .class_name("Tournament::TeamPlayer")
        .inverse_of(:player)
    }
  end

  describe "#to_s" do
    it "should return player name" do
      player = FactoryBot.create(:player_basis, name: "Name 1")
      expect("#{player}").to eq player.name
    end
  end

  describe "#to_label" do
    let(:player) { FactoryBot.create(:player_basis, nickname: nickname) }
    let(:nickname) { FFaker::Lorem.word }
    context "when nickname is present" do
      it "should return player name with the nickname in parentheses" do
        expect("#{player} (#{player.nickname})").to eq player.to_label
      end
    end

    context "when nickname is not present" do
      let(:nickname) { nil }
      it "should return player name without the nickname" do
        expect("#{player}").to eq player.to_label
      end
    end
  end

end
