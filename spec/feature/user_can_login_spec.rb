require 'rails_helper'

RSpec.feature "user can login to account" do
  scenario "a user can login" do
    user = create(:user)

    visit root_path
    click_on "Login to Account"

    current_path.should == login_path

    fill_in "Name", with: user.name
    fill_in "Password", with: user.password
    click_on "Login"

    current_path.should == user_path(user)
    expect(page).to have_content "Logged in"
    expect(page).to have_content user.name
  end

  scenario "user can log out" do
    user = create(:user)

    visit login_path

    fill_in "Name", with: user.name
    fill_in "Password", with: user.password
    click_on "Login"

    current_path.should == user_path(user)
    click_on "Log Out"

    current_path.should == root_path
    expect(page).to have_content "WELCOME!"

  end

  scenario "user sees error with invalid password or name" do
    user = create(:user)

    visit login_path
    fill_in "Name", with: user.name
    fill_in "Password", with: "darkness...unending"
    click_on "Login"

    current_path.should == login_path
    expect(page).to have_content "User name or password are invalid"
  end

end