require 'rails_helper'

RSpec.describe "team/bases/index", type: :view do
  before(:each) do
    assign(:team_bases, [
      Team::Base.create!(
        :name => "Name"
      ),
      Team::Base.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of team/bases" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
