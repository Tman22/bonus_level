require 'rails_helper'

RSpec.feature "user_can_create_an_article" do
  scenario "they create and view and article" do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit user_path(user)
    click_on "Create Article"

    current_path.should == new_article_path

    fill_in "Title", with: "Title"
    fill_in "Body", with: "Something"
    fill_in "Article image", with: "http://bamboozo.com/sites/default/files/styles/600x1000/public/preview_16.jpg"
    fill_in "Tags", with: "Ruby"
    click_on "Create Article"
    current_path.should == article_path(Article.first)
    expect(page).to have_content "Title"
    expect(page).to have_content "Something"
    expect(page).to have_content "Ruby"
    expect(page).to have_content user.name
    # expect(page).to have_link "Ruby", href: tag_path(Tag.first)
  end
end