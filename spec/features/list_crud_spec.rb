require "rails_helper"
feature "User creates a list" do
  let(:user) { FactoryGirl.create(:user) }
  scenario "successfully" do
    sign_in_as(user)
    visit root_path
    click_on "New List"
    fill_in "Title", with: "List"
    fill_in "Content", with: "List element"
    click_on "Create List"

    expect(page).to have_content "List Created"
  end

  scenario "unsuccessfully" do
    visit root_path
    sign_in_as(user)
    click_on "New List"
    click_on "Create List"

    expect(page).to have_content "Invalid Entry"
  end

  scenario "unsigned in" do
    visit root_path
    click_on "New List"

    expect(page).to have_content "You must sign in first!"
  end
end

feature "User edits a list" do
  let(:user) { FactoryGirl.create(:user) }
  let(:other_user) { FactoryGirl.create(:user) }
  let(:list) { FactoryGirl.create(:list) }
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

  scenario "that doesn't belong to him" do
    sign_in_as(other_user)
    visit edit_list_path(list)

    expect(page).to have_content "You aren't authorized to do that."
  end
end

feature "User deletes a list" do
  let(:user) { FactoryGirl.create(:user) }
  scenario "successfully" do
    write_list(user)
    click_on "Delete"

    expect(page).to have_content "List deleted."
  end
end
