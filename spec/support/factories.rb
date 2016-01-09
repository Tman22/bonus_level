FactoryGirl.define do
  factory :user do
    name
    password
    image_path "http://bamboozo.com/sites/default/files/styles/600x1000/public/preview_16.jpg"
    role 0
    factory :user_with_articles do
      transient do
        article_count 2
      end
      after(:create) do |user, evaluator|
        create_list(:article, evaluator.article_count, user: user)
      end
    end
  end

  factory :article do
    title
    body
    article_image "http://bamboozo.com/sites/default/files/styles/600x1000/public/preview_16.jpg"
  end

  sequence :title do |n|
    "title#{n}"
  end

  sequence :body do |n|
    "body#{n}"
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
