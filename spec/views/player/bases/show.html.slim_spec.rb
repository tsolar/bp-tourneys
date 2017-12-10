require "rails_helper"

RSpec.describe "player/bases/show", type: :view do
  before(:each) do
    @player_basis = assign(:player_basis, Player::Base.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
