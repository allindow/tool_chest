require 'rails_helper'

describe "User can create new tool" do
  scenario "User creates a new tool" do
    user = User.create(name: "Angela", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(user)

    click_on "Create Tool"
    fill_in "Name", :with => "Screwdriver"

    click_button "Create Tool"
    within (".tool_info") do
      expect(page).to have_content("Screwdriver")
    end
    visit user_path(user)
    within "#newest_tool" do
      expect(page).to have_content("Screwdriver")
    end
  end
end
