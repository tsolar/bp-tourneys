require 'rails_helper'

RSpec.describe "player/bases/index", type: :view do
  before(:each) do
    assign(:player_bases, [
      Player::Base.create!(),
      Player::Base.create!()
    ])
  end

  it "renders a list of player/bases" do
    render
  end
end
