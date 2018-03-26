FactoryBot.define do

  sequence(:id) { |n| "#{n}" }

  factory :product do
    id
    name "Scarf"
    description "Nice and warm"
    price 10
    colour "grey"
  end

end
