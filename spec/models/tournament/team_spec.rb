require 'rails_helper'

RSpec.describe Tournament::Team, type: :model do
  describe "Validations" do
  end

  describe "Relationships" do
    it { should belong_to(:team)
                 .class_name('Team::Base')
                 .with_foreign_key(:team_id) }

    it { should belong_to(:tournament)
                 .class_name('Tournament::Base')
                 .with_foreign_key(:tournament_id) }
  end
end
