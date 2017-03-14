FactoryGirl.define do
  factory :tournament_basis, class: 'Tournament::Base' do
    sequence(:name) { |n| "Tournament #{n}" }

    factory :tournament_basis_invalid do
      name nil
    end
  end
end
