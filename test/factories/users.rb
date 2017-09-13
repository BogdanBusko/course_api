FactoryGirl.define do
  factory :user do
    full_name "MyString"
    email "MyString"
    password_digest "MyString"
    employer false
    account_confirmation false
  end
end
