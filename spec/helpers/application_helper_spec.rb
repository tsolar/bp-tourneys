require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "country name" do
    context "country_code given" do
      it "returns country name from ISO3166 alpha2 code" do
        expect(helper.country_name("US")).to eq "United States of America"
      end
    end

    context "no country_code given" do
      it "returns an empty string" do
        expect(helper.country_name(nil)).to eq ""
      end
    end
  end
end
