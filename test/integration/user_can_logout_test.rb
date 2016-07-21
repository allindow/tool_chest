require_relative "../test_helper"

class UserCanLogout < ActionDispatch::IntegrationTest
  test "user can logout" do
    user = User.create(name: "Angela", password: "password")

    visit login_path
    fill_in "Name", with: "Angela"
    fill_in "Password", with: "password"
    click_on "Sign In"

    assert_equal user_path(user), current_path
    click_on "Logout"

    assert_equal root_path, current_path

    refute page.has_content?("Angela")
  end
end
