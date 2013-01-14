FactoryGirl.define do
  factory :user do
    name "John"
    email "john@gmail.com"
    password "foo"
  end

  factory :nil_user do
    name nil
    email nil
    password nil
  end
end

