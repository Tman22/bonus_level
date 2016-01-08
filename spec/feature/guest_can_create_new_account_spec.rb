require 'rails_helper'

RSpec.feature "guest can create account" do
  scenario "guest visits root page clicks create account" do

    visit root_path
    click_on "Create Account"
    current_path.should == new_user_path

    fill_in "Name", with: "Batman"
    fill_in "Password", with: "darkness"
    fill_in "Password confirmation", with: "darkness"
    fill_in "Image", with: "http://bamboozo.com/sites/default/files/styles/600x1000/public/preview_16.jpg"
    click_on "Create"

    current_path.should == user_path(User.first)
    expect(page).to have_content "Account Created!"
    expect(page).to have_content "Batman"
  end

  scenario "guest had wrong passwords didn't match" do
    visit root_path
    click_on "Create Account"
    current_path.should == new_user_path

    fill_in "Name", with: "tman"
    fill_in "Password", with: "darkness"
    fill_in "Password confirmation", with: "dkness"
    fill_in "Image", with: "http://bamboozo.com/sites/default/files/styles/600x1000/public/preview_16.jpg"
    click_on "Create"
# save_and_open_page
    current_path.should == users_path
    expect(page).to have_content "Password confirmation doesn't match Password"

  end
end
