require "rails_helper"
feature "User comments on a list" do
  let(:user) { FactoryGirl.create(:user) }
  let(:list) { FactoryGirl.create(:list) }

  scenario "successfully" do
    sign_in_as(user)
    visit list_path(list)
    click_on "New Comment"
    fill_in "Content", with: "This is a comment"
    click_on "Create Comment" 
  end
end
