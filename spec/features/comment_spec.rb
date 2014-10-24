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
    expect(page).to have_content("Comment Created")
    expect(page).to have_content("This is a comment")
  end
  # scenario "unsuccessfully" do
  #   sign_in_as(user)
  #   visit list_path(list)
  #   click_on "New Comment"
  #   fill_in "Content", with: nil
  #   click_on "Create Comment"
  #   expect(page).to have_content "Invalid Entry"
  # end
end

feature "User edits a comment" do
  let(:user) { FactoryGirl.create(:user) }
  let(:list) { FactoryGirl.create(:list) }
  scenario "successfully" do
    sign_in_as(user)
    visit list_path(list)
    click_on "New Comment"
    fill_in "Content", with: "This is a comment"
    click_on "Create Comment"
    expect(page).to have_content("Comment Created")
    click_on "Edit Comment"

    fill_in "Content", with: "This is also a comment"
    click_on "Update Comment"
    expect(page).to have_content("This is also a comment")
  end
end

feature "User deletes a comment" do
  let(:user) { FactoryGirl.create(:user) }
  let(:list) { FactoryGirl.create(:list) }
  scenario "successfully" do
    sign_in_as(user)
    visit list_path(list)
    click_on "New Comment"
    fill_in "Content", with: "This is a comment"
    click_on "Create Comment"
    expect(page).to have_content("Comment Created")
    click_on "Delete Comment"

    expect(page).to have_content("Comment deleted")
  end
end
