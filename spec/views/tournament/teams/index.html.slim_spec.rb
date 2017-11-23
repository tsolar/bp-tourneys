require "rails_helper"

RSpec.describe "tournament/teams/index", type: :view do
  before(:each) do
    assign(:tournament_teams, FactoryGirl.create_list(:tournament_basis, 2))
  end

  it "renders a list of tournament/teams" do
    skip "will test this later, maybe not needed"
    render
  end
end
