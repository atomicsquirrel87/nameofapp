FactoryBot.define do

  sequence(:email) {|n| "user#{n}@example.com"}

  factory :admin, class: User do
    email
    password "123456"
    first_name "Do"
    last_name "Do"
    admin true
  end

  factory :user do
    email
    password "654321"
    first_name "James"
    last_name "Bond"
    admin false
  end
  
end
