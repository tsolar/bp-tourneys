require "rails_helper"

RSpec.describe "tournament/teams/show", type: :view do
  before(:each) do
    @tournament_team = assign(
      :tournament_team,
      FactoryBot.create(:tournament_basis)
    )
  end

  it "renders attributes in <p>" do
    skip "will test this later, maybe not needed"
    render
  end
end
