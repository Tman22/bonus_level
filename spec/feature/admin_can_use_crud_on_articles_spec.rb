require 'rails_helper'

RSpec.feature "admin can use full crud functionality for articles" do
  scenario "admin can view all articles in the index" do
    pending
    admin = create(:admin)

    user1, user2 = create_list(:user_with_articles, 2)

    ApplicationController.any_instance.stubs(:current_user).returns(user1)
    visit articles_path
    
    current_path.should == articles_path
    expect(page).to have_content "Author: #{user2.name}"
    expect(page).to have_link user2.articles.first.title,
                              href: article_path(user2.articles.first)
  end

  scenario "admin can create an article" do
    pending
  end

end