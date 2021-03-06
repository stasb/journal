FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
  end

  factory :invalid_user, parent: :user do
    email nil
  end

  factory :account do
    sequence(:name)  { |n| "Person #{n}" }
  end

  factory :project do
    sequence(:name)  { |n| "Project #{n}" }
  end

  factory :entry do
    sequence(:title)  { |n| "Entry title #{n}" }
    sequence(:body)  { |n| "Lorem Ipsum #{n}" }
  end
end

