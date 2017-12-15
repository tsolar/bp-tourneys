require "rails_helper"

RSpec.describe "tournament/bases/edit", type: :view do
  before(:each) do
    @tournament_base = assign(
      :tournament_base,
      FactoryBot.create(:tournament_basis)
    )
  end

  it "renders the edit tournament_base form" do
    skip "will test this later, maybe not needed"
    render

    assert_select "form[action=?][method=?]", tournament_base_path(@tournament_base), "post" do

      assert_select "input#tournament_base_name[name=?]", "tournament_base[name]"
    end
  end
end
