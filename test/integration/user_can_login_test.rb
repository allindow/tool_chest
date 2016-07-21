require_relative '../test_helper'

class UserCanLoginTest < ActionDispatch::IntegrationTest

  test "user can be created" do
    visit new_user_path
    fill_in "Name", with: "Angela"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, Angela!")
  end

  test "user can login with valid credentials" do
    user = User.create(name: "Angela", password: "password")

    visit login_path

    fill_in "Name", with: "Angela"
    fill_in "Password", with: "password"
    click_on "Sign In"

    assert_equal user_path(user), current_path

    within("#greeting") do
      assert page.has_content?("Welcome, Angela!")
    end
  end

  test "user gets error message with missing or wrong credentials" do

  end
end
