require "rails_helper"
feature "User comments on a list" do
  let(:user) { FactoryGirl.create(:user) }
  let(:list) { FactoryGirl.create(:list) }

  scenario "successfully" do
    sign_in_as(user)
    visit list_path(list)
    click_on "New Comment"

    expect(page).to have_content "New Comment"
  end
end
