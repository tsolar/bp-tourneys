require 'rails_helper'

RSpec.describe "team/bases/new", type: :view do
  before(:each) do
    assign(:team_base, Team::Base.new(
      :name => "MyString"
    ))
  end

  it "renders new team_base form" do
    render

    assert_select "form[action=?][method=?]", team_bases_path, "post" do

      assert_select "input#team_base_name[name=?]", "team_base[name]"
    end
  end
end
