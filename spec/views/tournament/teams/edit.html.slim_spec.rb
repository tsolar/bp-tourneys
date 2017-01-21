require 'rails_helper'

RSpec.describe "tournament/teams/edit", type: :view do
  before(:each) do
    @tournament_team = assign(:tournament_team, Tournament::Team.create!())
  end

  it "renders the edit tournament_team form" do
    render

    assert_select "form[action=?][method=?]", tournament_team_path(@tournament_team), "post" do
    end
  end
end
