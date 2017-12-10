FactoryGirl.define do
  factory :tournament_basis, class: "Tournament::Base" do
    sequence(:name) { |n| "Tournament #{n}" }
    owner { User.last || FactoryGirl.create(:user) }

    factory :tournament_basis_invalid do
      name nil
      owner nil
    end
  end
end
