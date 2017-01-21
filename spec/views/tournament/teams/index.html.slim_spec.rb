require 'rails_helper'

RSpec.describe "tournament/teams/index", type: :view do
  before(:each) do
    assign(:tournament_teams, [
      Tournament::Team.create!(),
      Tournament::Team.create!()
    ])
  end

  it "renders a list of tournament/teams" do
    render
  end
end
