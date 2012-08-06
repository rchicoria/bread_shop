FactoryGirl.define do
  factory :user do
    username "jdoe"
    fullname "John Doe"
    email "jdoe@mail.com"
    phone_number "123456789"
    password "testpass"
    roles { [Role.find_by_name('customer')] }
  end
end