require "rails_helper"

RSpec.describe "tournament/bases/index", type: :view do
  before(:each) do
    assign(
      :tournament_bases,
      FactoryBot.create_list(:tournament_basis, 2)
    )
  end

  it "renders a list of tournament/bases" do
    skip "will test this later, maybe not needed"
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
