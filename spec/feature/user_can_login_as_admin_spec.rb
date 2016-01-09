require 'rails_helper'

RSpec.feature "user can login as an admin" do
  scenario "a user logs in as existing admin" do
    admin = create(:admin)

    visit root_path
    click_on "Login to Account"

    current_path.should == login_path

    fill_in "Name", with: admin.name
    fill_in "Password", with: admin.password
    click_on "Login"

    current_path.should == admin_user_path(admin)
    expect(page).to have_content "Logged in"
    expect(page).to have_content admin.name
  end

  scenario "non-admin user tries to visit admin page" do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit admin_user_path(user)

    expect(page).to_not have_content "Logged in"
    expect(page).to have_content "The page you were looking for doesn't exist."
  end

end