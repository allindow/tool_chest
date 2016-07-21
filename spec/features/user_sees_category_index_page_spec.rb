require 'rails_helper'

describe "User can see their tools in category" do
  scenario "in category show page they only see their own tools" do
    category = Category.create(name: "Pointy")
    user = User.create(name: "Angela", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit categories_path

    expect(page).to have_content("Pointy")
    expect(page).to_not have_content("Edit")
    expect(page).to_not have_content("Delete")
  end
end
