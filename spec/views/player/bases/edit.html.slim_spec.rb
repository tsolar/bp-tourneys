require "rails_helper"

RSpec.describe "player/bases/edit", type: :view do
  before(:each) do
    @player_basis = assign(:player_basis, Player::Base.create!())
  end

  it "renders the edit player_basis form" do
    render

    assert_select "form[action=?][method=?]", player_basis_path(@player_basis), "post" do
    end
  end
end
