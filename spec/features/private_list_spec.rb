require "rails_helper"
feature "user creates new private list" do
  let(:user) { FactoryGirl.create(:user) }
  scenario "sucessfully" do
    sign_in_as(user)
    click_on "New List"
    fill_in "Title", with: "List"
    fill_in "Content", with: "List element"
    select "Yes", from: "Private"
    click_on "Create List"

    expect(page).to have_content "List Created"
  end
end

feature "people visit the list" do
  let(:user) { FactoryGirl.create(:user) }
  let(:list) { FactoryGirl.create(:private_list) }
  let(:admin) { FactoryGirl.create(:admin) }
  scenario "owner visits" do
    sign_in_as(list.user)
    visit list_path(list)
    expect(page).to have_content "PRIVATE"
  end

  scenario "non-owner visits" do
    visit list_path(list)

    expect(page).to have_content "This list is private"
  end

  scenario "admin visits" do
    sign_in_as(admin)
    visit list_path(list)

    expect(page).to have_content "PRIVATE"
  end
end
