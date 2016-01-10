require 'rails_helper'

RSpec.feature "User can see articles" do
  scenario "and they can edit their own" do
    user = create(:user_with_articles)
    article = user.articles.first

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit articles_path
    click_on article.title

    current_path.should == article_path(article)
    expect(page).to have_link "Edit", href: edit_article_path(article)

    click_on "Edit"

    fill_in "Title", with: "Darkness"
    fill_in "Body", with: "Batman has problems"
    click_on "Complete"

    current_path.should == article_path(article)
    expect(page).to have_content "Darkness"
    expect(page).to have_content "Batman has problems"
    expect(page).to have_content user.name
    expect(page).to_not have_content "body1"
  end

  scenario "and they can delete their own" do
    user = create(:user_with_articles)
    article = user.articles.first

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit articles_path
    click_on article.title

    current_path.should == article_path(article)
    expect(page).to have_link "Delete", href: article_path(article)

    click_on "Delete"

    current_path.should == articles_path
    expect(page).to_not have_content "Name1"
  end

end