require 'test_helper'

class AdminViewsCategoriesTest < ActionDispatch::IntegrationTest
  test "logged in admin can view the categories" do
    Category.create(name: "Pointy")
    Category.create(name: "Expensive")
    admin = User.create!(name: "Angela", password: "pineapple", role: 1) #the role is the enum....
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path

    assert page.has_content?("Admin Categories")

    # within ("#categories_list") do
    #   assert page.has_content("Pointy")
    #   assert page.has_content("Expensive")
    # end
  end
end
