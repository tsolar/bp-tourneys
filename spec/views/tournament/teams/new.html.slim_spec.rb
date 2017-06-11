require 'rails_helper'

RSpec.describe "tournament/teams/new", type: :view do
  before(:each) do
    assign(:tournament_team, Tournament::Team.new())
  end

  it "renders new tournament_team form" do
    skip "will test this later, maybe not needed"
    render

    assert_select "form[action=?][method=?]", tournament_teams_path, "post" do
    end
  end
end
