require "rails_helper"

RSpec.describe "player/bases/index", type: :view do
  before(:each) do
    assign(:player_bases, FactoryBot.create_list(:player_basis, 2))
  end

  it "renders a list of player/bases" do
    render
  end
end
