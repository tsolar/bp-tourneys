require 'rails_helper'

RSpec.describe "tournament/teams/show", type: :view do
  before(:each) do
    @tournament_team = assign(:tournament_team, Tournament::Team.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
