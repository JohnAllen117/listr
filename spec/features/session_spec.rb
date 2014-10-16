require "rails_helper"
feature "user signs" do
  let(:user) { FactoryGirl.create(:user) }
  scenario "in" do
    sign_in_as(user)

    expect(page).to have_content user.first_name
  end

  scenario "out" do
    sign_in_as(user)

    click_on "Sign out"
    expect(page).not_to have_content user.first_name
  end
end
