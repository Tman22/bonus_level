require 'rails_helper'

RSpec.feature "user can view all articles" do
  scenario "user can view articles by other users" do
    user1, user2 = create_list(:user_with_articles, 2)

    ApplicationController.any_instance.stubs(:current_user).returns(user1)
    visit articles_path
    
    current_path.should == articles_path
    expect(page).to have_content "Author: #{user2.name}"
    expect(page).to have_link user2.articles.first.title,
                              href: article_path(user2.articles.first)
  end

end
