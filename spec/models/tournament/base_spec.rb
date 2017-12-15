require "rails_helper"

RSpec.describe Tournament::Base, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:starts_at) }
    it {
      expect(FactoryBot.build(:tournament_basis, starts_at: nil))
        .to_not validate_presence_of(:ends_at)
    }

    describe "datetime validations" do
      let(:starts_at) { Time.current }
      let(:ends_at) { Time.current + 1.week }
      let(:tournament) {
        FactoryBot.build(
          :tournament_basis,
          starts_at: starts_at,
          ends_at: ends_at
        )
      }

      context "when starts_at is present" do
        context "when starts_at is before ends_at" do
          it { expect(tournament).to be_valid }
        end

        context "when starts_at is after ends_at" do
          let(:ends_at) { Time.current - 1.week }
          it { expect(tournament).to be_invalid }
        end

        context "when starts_at is equal to ends_at" do
          let(:ends_at) { starts_at }
          it { expect(tournament).to be_valid }
        end

        context "when ends_at is not present" do
          let(:ends_at) { nil }
          it { expect(tournament).to be_valid }
        end
      end
    end
  end

  describe "Relationships" do
    it { should have_many(:tournament_teams)
        .class_name("Tournament::Team")
        .with_foreign_key(:tournament_id) }

    it { should have_many(:teams)
        .through(:tournament_teams)
        .class_name("Team::Base")
        .source(:team) }

    it { should belong_to(:owner)
        .class_name("User")
        .with_foreign_key(:owner_id)
        .inverse_of(:tournaments) }

  end

  describe "Create" do
    it "should create a valid Tournament" do
      tournament = FactoryBot.create(:tournament_basis)
      expect(tournament).to be_valid
      expect(tournament).to be_persisted
    end

    it "should not create an invalid Tournament" do
      tournament = FactoryBot.build(:tournament_basis_invalid)
      expect(tournament).not_to be_valid
      expect(tournament.save).to be false
    end
  end

  describe "#country_name" do
    let(:country_code) { "US" }
    let(:tournament) {
      FactoryBot.create(:tournament_basis, country_code: country_code)
    }

    context "when country_code is present" do
      context "when country_code is valid" do
        it "returns country name from ISO3166" do
          expect(tournament.country_name).to eq ISO3166::Country.new(tournament.country_code).name
        end
      end

      context "when country_code is not valid" do
        let(:country_code) { "XX" }
        it "returns an empty string" do
          expect(tournament.country_name).to eq ""
        end
      end
    end

    context "when country_code is present" do
      context "when country_code is not valid" do
        let(:country_code) { nil }
        it "returns an empty string" do
          expect(tournament.country_name).to eq ""
        end
      end
    end
  end

  describe "#country_emoji" do
    let(:country_code) { "US" }
    let(:tournament) {
      FactoryBot.create(:tournament_basis, country_code: country_code)
    }

    context "when country_code is present" do
      context "when country_code is valid" do
        it "returns emoji flag" do
          expect(tournament.country_emoji).to eq ISO3166::Country.new(tournament.country_code).emoji_flag
        end
      end

      context "when country_code is not valid" do
        let(:country_code) { "XX" }
        it "returns an empty string" do
          expect(tournament.country_emoji).to eq ""
        end
      end
    end

    context "when country_code is present" do
      context "when country_code is not valid" do
        let(:country_code) { nil }
        it "returns an empty string" do
          expect(tournament.country_emoji).to eq ""
        end
      end
    end
  end

  describe "#country_name_with_emoji" do
    let(:country_code) { "US" }
    let(:tournament) {
      FactoryBot.create(:tournament_basis, country_code: country_code)
    }

    context "when country_code is present" do
      context "when country_code is valid" do
        it "returns emoji flag" do
          expect(tournament.country_name_with_emoji).to eq "#{tournament.country_emoji} #{tournament.country_name}"
        end
      end

      context "when country_code is not valid" do
        let(:country_code) { "XX" }
        it "returns an empty string" do
          expect(tournament.country_name_with_emoji).to eq ""
        end
      end
    end

    context "when country_code is present" do
      context "when country_code is not valid" do
        let(:country_code) { nil }
        it "returns an empty string" do
          expect(tournament.country_name_with_emoji).to eq ""
        end
      end
    end
  end
end
