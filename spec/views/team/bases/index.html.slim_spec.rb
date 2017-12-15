require "rails_helper"

RSpec.describe "team/bases/index", type: :view do
  before(:each) do
    assign(:team_bases, FactoryBot.create_list(:team_basis, 2))
  end

  it "renders a list of team/bases" do
    render
    assert_select "tr>td", text: Team::Base.last(2).last.name.to_s, count: 1
    assert_select "tr>td", text: Team::Base.last(2).first.name.to_s, count: 1
  end
end
