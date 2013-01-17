FactoryGirl.define do
  factory :user do
    name "John"
    email "john@gmail.com"
    password "foo"
  end

  factory :invalid_user, parent: :user do
    email nil
  end
end

