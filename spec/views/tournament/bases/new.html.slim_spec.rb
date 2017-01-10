require 'rails_helper'

RSpec.describe "tournament/bases/new", type: :view do
  before(:each) do
    assign(:tournament_base, Tournament::Base.new(
      :name => "MyString"
    ))
  end

  it "renders new tournament_base form" do
    render

    assert_select "form[action=?][method=?]", tournament_bases_path, "post" do

      assert_select "input#tournament_base_name[name=?]", "tournament_base[name]"
    end
  end
end
