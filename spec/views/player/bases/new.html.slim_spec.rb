require "rails_helper"

RSpec.describe "player/bases/new", type: :view do
  before(:each) do
    assign(:player_basis, Player::Base.new())
  end

  it "renders new player_basis form" do
    render

    assert_select "form[action=?][method=?]", player_bases_path, "post" do
    end
  end
end
