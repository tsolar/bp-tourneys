require 'rails_helper'

RSpec.describe "tournament/bases/show", type: :view do
  before(:each) do
    @tournament_base = assign(:tournament_base, Tournament::Base.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    skip "will test this later, maybe not needed"
    render
    expect(rendered).to match(/Name/)
  end
end
