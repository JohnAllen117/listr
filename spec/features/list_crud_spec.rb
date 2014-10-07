require 'rails_helper'
feature "User creates a list" do
  scenario "successfully" do
    visit root_path
    click_on 'New List'
    fill_in 'Title', with: "List"
    fill_in 'Content', with: "List element"
    click_on 'Create List'

    expect(page).to have_content "List Created"
  end
end
