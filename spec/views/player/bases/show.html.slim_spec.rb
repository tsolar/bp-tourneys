require "rails_helper"

RSpec.describe "player/bases/show", type: :view do
  before(:each) do
    @player_basis = assign(:player_basis, FactoryBot.create(:player_basis))
  end

  it "renders attributes in <p>" do
    render
  end
end
