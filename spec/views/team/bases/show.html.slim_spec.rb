require 'rails_helper'

RSpec.describe "team/bases/show", type: :view do
  before(:each) do
    @team_base = assign(:team_base, Team::Base.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    skip "will test this later, maybe not needed"
    render
    expect(rendered).to match(/Name/)
  end
end
