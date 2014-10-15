require 'rails_helper'
  feature "User creates a list" do
  let(:user) { FactoryGirl.create(:user) }
  scenario "successfully" do
    sign_in_as(user)
    visit root_path
    click_on 'New List'
    fill_in 'Title', with: "List"
    fill_in 'Content', with: "List element"
    click_on 'Create List'

    expect(page).to have_content "List Created"
  end

  scenario "unsuccessfully" do
    visit root_path
    sign_in_as(user)
    click_on 'New List'
    click_on 'Create List'

    expect(page).to have_content "Invalid Entry"
  end
end

feature "User edits a list" do
  let(:user) { FactoryGirl.create(:user) }
  scenario "successfully" do
    write_list(user)
    click_on "Edit"
    fill_in "Content", with: "Updated List Content"
    click_on "Update List"

    expect(page).to have_content "List updated"
    expect(page).to have_content "Updated List Content"
  end

  scenario "unsuccessfully" do
    write_list(user)
    click_on "Edit"
    fill_in "Content", with: nil
    click_on "Update List"

    expect(page).to have_content "Invalid Entry"
  end
end
