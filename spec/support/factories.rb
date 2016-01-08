FactoryGirl.define do
  factory :user do
    name
    password
    image_path "http://bamboozo.com/sites/default/files/styles/600x1000/public/preview_16.jpg"
    role 0
  end

  sequence :name do |n|
    "name#{n}"
  end

  sequence :password do |n|
    "password#{n}"
  end

  factory :admin, class: User do
    name
    password
    image_path "http://bamboozo.com/sites/default/files/styles/600x1000/public/preview_16.jpg"
    role 1
  end

end