require "rails_helper"

feature "user searches" do
  let(:list) { FactoryGirl.create(:list) }
  scenario "a list" do
    visit root_path
    fill_in "Search by title", with: list.title
    click_on "Search"

    expect(page).to have_content list.title
  end
end
