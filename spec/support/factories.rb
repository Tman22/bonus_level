FactoryGirl.define do
  factory :user do
    name
    password
    image_path "http://bamboozo.com/sites/default/files/styles/600x1000/public/preview_16.jpg"
  end

  sequence :name do |n|
    "name#{n}"
  end

  sequence :password do |n|
    "password#{n}"
  end
end
