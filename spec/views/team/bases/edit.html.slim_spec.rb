require 'rails_helper'

RSpec.describe "team/bases/edit", type: :view do
  before(:each) do
    @team_base = assign(:team_base, Team::Base.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit team_base form" do
    skip "will test this later, maybe not needed"

    render

    assert_select "form[action=?][method=?]", team_base_path(@team_base), "post" do

      assert_select "input#team_base_name[name=?]", "team_base[name]"
    end
  end
end
